#This is desifgned to be ran via Unraid Custom User Scripts on PostgreSQL docker container databases
#Be sure that the PGPASSWORD environment variable / container variable is already set with the correct password
#!/bin/bash
mkdir /mnt/user/share/Backups/Application/DB/$(date +"%Y.%m.%d")
docker exec postgresql14 pg_dump -h 192.168.IP.ADDR -U dbusername dbname > /mnt/user/share/Backups/Application/DB/$(date +"%Y.%m.%d")/application-db-backup-$(date +"%Y.%m.%d").sql
