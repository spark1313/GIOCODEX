#Backup a PostgreSQL database:
sudo su postgres
pg_dump databasenamegoeshere > /path/dbname-backup-$(date +"%Y-%m-%d").sql

#Create a postgres database:
createdb -E UTF8 -T template0 dbname

#Import into a postgres database:
psql dbname < db-backup.sql

#Backup a MySQL database:
sudo su
mysqldump -u dbuser -p dbname > /path/dbname-backup-$(date +"%Y-%m-%d").sql

#Upgrade a PostgreSQL database:
pg_upgrade \
    -b /var/lib/pgsql/bin-pg9 \
    -d /var/lib/pgsql/data-pg9 \
    -D /var/lib/pgsql/data \
    -B /usr/bin/ \
    -c
#-b is for the old bin dir (env var PGBINOLD)
#-d is for the old config dir (env var PGDATAOLD)
#-D is for the new config dir (env var PGDATANEW)
#-B is for the new bin dir (env var PGBINNEW)
#-c is for pre-upgrade consistency checking only, simply remove this argument when performing for realsies

#When upgrading from PostgreSQL 9.2 to a newer version via pg_upgrade, apply this fix to patch the new unix_socket_directories variable name into the old binary which used unix_socket_directory to let pg_upgrade work properly
mv /var/lib/pgsql/bin-pg9/pg_ctl{,-orig}
echo '#!/bin/bash' > /var/lib/pgsql/bin-pg9/pg_ctl
echo '"$0"-orig "${@/unix_socket_directory/unix_socket_directories}"' >> /var/lib/pgsql/bin-pg9/pg_ctl
chmod +x /var/lib/pgsql/bin-pg9/pg_ctl

#Run a mysql query from Bash CLI via database user with password auth:
mysql -u dbusername -p -D dbname -e 'SELECT * FROM table WHERE column IS condition OR othercolumn != value'
#Same as above but send output to an external file instead of within the console:
mysql -u dbusername -p -D dbname -e 'SELECT * FROM table WHERE column IS condition OR othercolumn != value' > /directory/path/output.txt
