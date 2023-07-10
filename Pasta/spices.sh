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
