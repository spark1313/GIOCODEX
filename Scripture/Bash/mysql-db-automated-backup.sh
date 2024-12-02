#This is desifgned to be ran via Unraid Custom User Scripts on MariaDB docker container databases
#!/bin/bash
mkdir /mnt/user/share/Backups/Application/DB/$(date +"%Y.%m.%d")
docker exec mariadb mysqldump -h 192.168.IP.ADDR -u dbusername -ppasswordgoeshere dbname > /mnt/user/share/Backups/Application/DB/$(date +"%Y.%m.%d")/application-db-backup-$(date +"%Y.%m.%d").sql
