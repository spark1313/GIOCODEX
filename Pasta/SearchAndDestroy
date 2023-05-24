#List all files in a directory greater than 20MB, ending in .zip, and having not been modified in 20 days or more:
find /only/the/best/directory/path -type f -size +20M -name '*.zip' -mtime +20 -exec ls -alh {} \;

#Delete the above mentioned:
find /only/the/best/directory/path -type f -size +20M -name '*.zip' -mtime +20 -exec rm -f {} \;
