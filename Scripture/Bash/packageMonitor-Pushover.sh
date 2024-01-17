#!/bin/bash
#############
#Notes:
#1. This script is intended for systems which use apt-get as a package manager and if your system uses a different package manager you must tune the script for it to work
#2. Make the script executable via chmod a+x
#3. This script can be easily adapted for other notification services by editing the curl line to pass any differences in parameters and adding in any new variables or tokens if needed
#Ref:
#1. https://www.reddit.com/r/selfhosted/comments/bqt6eu/comment/eoa8txx/
#############

#Input your Pushover app and user tokens here:
APPTOKEN='h4hg0771m'
USERTOKEN='it50v3r9000'

#Identify the packages with upgrades waiting:
PACKAGES=$(apt-get -s dist-upgrade | awk '/^Inst/ { print $2 }' 2>&1)
#Identify the number of packages with upgrades waiting:
PACKAGECOUNT=$(echo "$PACKAGES" | wc -l)

#If there are packages with upgrades waiting, trigger this loop:
if [ "$PACKAGES" != "" ]; then
        #Send a preformatted silent failsafe curl POST request in the background with one retry attempt, passing the output into /dev/null with the notification parameters passed in and variables inserted:
        curl -fs -o /dev/null 2>&1 --retry 1 -F "token=${APPTOKEN}" -F "user=${USERTOKEN}" -F "title=${TITLE}" -F "message=${MESSAGE}" "https://api.pushover.net/1/messages.json" &> /dev/null
fi

#If there are packages which have already been installed but are awaiting reboot, trigger this loop as well:
if [ -f /var/run/reboot-required ]; then
        #Identify packages awaiting reboot:
        REBOOTREQPACKAGES=$(cat /var/run/reboot-required.pkgs)
        REBOOTREQPACKAGECOUNT=$(echo "$REBOOTREQPACKAGES" | wc -l)

        #Send a preformatted silent failsafe curl POST request in the background with one retry attempt, passing the output into /dev/null with the notification parameters passed in and variables inserted:
        curl -fs -o /dev/null 2>&1 --retry 1 -F "token=${APPTOKEN}" -F "user=${USERTOKEN}" -F "title=$REBOOTREQPACKAGECOUNT packages installed on ${HOSTNAME} awaiting reboot" -F "message=Packages awaiting reboot: $REBOOTREQPACKAGES" "https://api.pushover.net/1/messages.json" &> /dev/null
fi
