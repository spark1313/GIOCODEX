#Run a command in the background:
<command> &

#Run one command onlt and after another finishes:
<command1> && <command2>

#Combination of above two:
$(command1 && command2) &

#Run a command but continue running even if disconnected, with all output sent to nohup.out in the local directory"
nohup <command>

#Run a nohup command in the background:
nohup <command> &

#Follow a log file line-by-line as it is generated
tail -f file.log

#Download something from the web (with the optional -O argument to specify a different filename for the downloaded file)
wget -O notavirus.zip.jpg.exe https://URL.domain/file.zip --progress=bar:force:noscroll

#Where yum repos are located:
/etc/yum.repos.d

#Find that one thing you typed that one time but only vaguely remember part of it:
history | grep keyword

#Make an alias: (add these in your shell's source file such as /etc/profile for all users bash)
alias roflcopter="echo soisoisoisoisoi"

#Make a symlink:
ln -s /path/where/shortcut/goes shortcut

#Rsync push to transfer files between Linux systems or Windows and Linux via SSH:
rsync -vP --rsh=ssh <filename>.<extension> <target username>@<target hostname>:/path/to/target/directory/<filename>.<extension>

#Do math in the terminal so you dont have to open a calculator to do quick math: (make sure you put spaces between the numbers)
expr 13 + 13

#Print file list:
ls | awk ' {print $NF}'

#Compute hashes in Windows:
certutil -hashfile file_name SHA512

#When upgrading from PostgreSQL 9.2 to a newer version via pg_upgrade, apply this fix to patch the new unix_socket_directories variable name into the old binary which used unix_socket_directory to let pg_upgrade work properly
mv /var/lib/pgsql/bin-pg9/pg_ctl{,-orig}
echo '#!/bin/bash' > /var/lib/pgsql/bin-pg9/pg_ctl
echo '"$0"-orig "${@/unix_socket_directory/unix_socket_directories}"' >> /var/lib/pgsql/bin-pg9/pg_ctl
chmod +x /var/lib/pgsql/bin-pg9/pg_ctl

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

#Backup a PostgreSQL database:
sudo su postgres
pg_dump databasenamegoeshere > databasenamegoeshere-backup-YY.MM.DD.sql

#Export a PostgreSQL database table to CSV:
COPY table_name TO '/directory/path/file.csv' WITH DELIMITER ',' CSV HEADER;
or
\copy (SELECT * FROM table_name) to 'C:\directory\path\file.csv' with csv

#Import a CSV into a PostgreSQL database table:
COPY table_name(column1_name, column2_name, column3_name) FROM '/directory/path/file.csv' WITH DELIMITER ',' CSV HEADER;

#Enable a versioned software in Amazon Linux:
amazon-linux-extras enable postgresql14

#Find your java bin and version:
readlink -f $(which java)

#Switch Java version if more than one version installed on the OS:
update-alternatives --config java

#Show datestamps for commands in history:
vi /etc/profile
Add this environment variable line: HISTTIMEFORMAT="%Y/%m/%d-%T: "
source /etc/profile

#Run a mysql query from Bash CLI via database user with password auth:
mysql -u dbusername -p -D dbname -e 'SELECT * FROM table WHERE column IS condition OR othercolumn != value' > /directory/path/output.txt

#Execute a Confluence Server SOAP JSON-RPC API call check:
https://<instance-name>/rpc/soap-axis/confluenceservice-v2?wsdl
#Rename a user with Confluence Server SOAP JSON-RPC API call:
curl --user "auth username":"auth password" -H "Content-Type: application/json" -H "Accept: application/json" -X POST -d '{"jsonrpc":"2.0", "method":"renameUser", "params":["username_being_renamed", "new_username"], "id":13}' https://<instance-URL>/rpc/json-rpc/confluenceservice-v2?os_authType=basic

#Insert the current date to a filename in Linux: (insert inline)
/directory/path/file-name-$(date +"%Y.%m.%d").txt

#SQL to add text to cells: 
UPDATE tablename SET columnname = CONCAT(columnname, "string") WHERE condition IS status;

#SQL to convert a column to lower case:
UPDATE tablename SET columnname = LOWER(othercolumnname);

#SQL to find cells which contain a specific string:
SELECT * FROM tablename WHERE columnname LIKE "%stringname%";



#Shell hotkeys:
#Go to beginning of line:
ctrl+a
#Go to end of line:
ctrl+e

##Vi hotkeys:
#Go to top of file:
gg
#Go to bottom of file:
shift+g
#Delete a line:
dd
