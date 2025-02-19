#!/bin/bash
#This is designed to be ran via Unraid Custom User Scripts on PostgreSQL docker container databases
#Be sure that the PGPASSWORD environment variable / container variable is already set with the correct password

#Define info about the mariadb/mysql database backing up
DBHOST='192.168.IP.ADDR'
DBNAME='dbnamegoeshere'
DBUSER='dbusergoeshere'

#OPTIONAL: Input your Gotify base URL here as well as the app token
BASEURL='notify.domain.com'
TOKEN='H4HG0771M'

#Define the path where planning to save the backup
SAVEPATH='/mnt/user/share/Backups/Application/DB/'

#First create the directory in case it goes not yet exist
mkdir -p $SAVEPATH

#Run the backup from within the corresponding docker container
docker exec postgresql14 pg_dump -h $DBHOST -U $DBUSER $DBNAME > $SAVEPATH/application-db-backup-$(date +"%Y.%m.%d").sql

#OPTIONAL: Get the file size of the DB backup
DBSIZE=`du -hm $SAVEPATH/application-db-backup-$(date +"%Y.%m.%d").sql | awk '{print $1}'`

#OPTIONAL: Send a Gotify notification on script execution
curl -X POST -fs -o /dev/null 2>&1 --retry 1 -F "title=$DBNAME database backup script completed" -F "message=$DBNAME database backup completed from $DBHOST via automated script and saved to $SAVEPATH with file size $DBSIZE MB" -F "priority=7" "https://${BASEURL}/message?token=${TOKEN}" &> /dev/null
