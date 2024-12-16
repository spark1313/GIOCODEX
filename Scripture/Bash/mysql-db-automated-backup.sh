#!/bin/bash
#This is designed to be ran via Unraid Custom User Scripts on MariaDB docker container databases

#Define info about the mariadb/mysql database backing up
DBHOST='192.168.IP.ADDR'
DBNAME='dbnamegoeshere'
DBUSER='dbusergoeshere'
DBUSERPW='dbuserpasswordgoeshere'

#OPTIONAL: Input your Gotify base URL here as well as the app token
BASEURL='notify.domain.com'
TOKEN='H4HG0771M'

#Define the path where planning to save the backup
SAVEPATH='/mnt/user/share/Backups/Application/DB/'

#First create the directory in case it goes not yet exist
mkdir -p $SAVEPATH

#Run the backup from within the corresponding docker container
docker exec mariadb mysqldump -h $DBHOST -u $DBUSER -p$DBUSERPW $DBNAME > $SAVEPATH/application-db-backup-$(date +"%Y.%m.%d").sql

#OPTIONAL: Send a Gotify notification on script execution
curl -X POST -fs -o /dev/null 2>&1 --retry 1 -F "title=$DBHOST database backup script completed" -F "message=Database backup completed and saved to $SAVEPATH" -F "priority=7" "https://${BASEURL}/message?token=${TOKEN}" &> /dev/null
