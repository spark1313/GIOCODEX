#!/bin/bash
#############
#Notes:
#1. Place this script in /etc/profile.d/ so that it is automatically ran via /etc/profile whenever a user logs in
#2. Make the script executable via chmod a+x
#3. This script can be easily adapted for other notification services by editing the curl line to pass any differences in parameters and adding in any new variables such as a user token if that is needed
#Ref:
#1. https://peekread.info/tech/20190716-ssh-login-notifications-with-gotify/
#2. https://gist.github.com/ngonkalves/04a06dadb1b6cce9b1ba0c604b2b7958
#3. https://web.archive.org/web/20191202101522/https://8192.one/post/ssh_login_notification_signal/
#############

#Input your Pushover app and user tokens here::
APPTOKEN='h4hg0771m'
USERTOKEN='it50v3r9000'

#The script triggers if the SSH_CLIENT variable exists:
if [ -n "$SSH_CLIENT" ]; then
        #Define the login time from date command:
        LOGINTIME="$(date "+%Y.%m.%d %H:%M")"
        #Pull in the client IP via the SSH_CLIENT variable:
        CLIENTIP=$(echo $SSH_CLIENT | awk '{print $1}')
        #Pull in the port via the SSH_CLIENT variable:
        PORT=$(echo $SSH_CLIENT | awk '{print $3}')
        #Pull in the server IP from the hostname command:
        SERVERIP=$(hostname -I | awk '{print $1}')
        #Define the notification title string, passing in crafted variables:
        TITLE="SSH Login Alert for ${USER}@${HOSTNAME}"
        #Define the message content string, passing in crafted variables:
        MESSAGE="${USER} logged in via SSH on ${HOSTNAME} at $SERVERIP over port $PORT from $CLIENTIP on $LOGINTIME"
        #Send a preformatted silent failsafe curl POST request in the background with one retry attempt, passing the output into /dev/null with the notification parameters passed in and variables inserted:
        curl -fs -o /dev/null 2>&1 --retry 1 -F "token=${APPTOKEN}" -F "user=${USERTOKEN}" -F "title=${TITLE}" -F "message=${MESSAGE}" "https://api.pushover.net/1/messages.json" &
#fye fo fum end the loop
fi
