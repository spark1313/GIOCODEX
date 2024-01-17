#!/bin/bash
#############
#Notes:
#1. This script is intended for systems which use apt-get as a package manager and if your system uses a different package manager you must tune the script for it to work
#2. Make the script executable via chmod a+x
#3. This script can be easily adapted for other notification services by editing the curl line to pass any differences in parameters and adding in any new variables such as a user token if that is needed
#Ref:
#1. https://www.reddit.com/r/selfhosted/comments/bqt6eu/comment/eoa8txx/
#############

#Input your Gotify base URL here as well as the app token:
BASEURL='notify.domain.com'
TOKEN='H4HG0771M'

#Identify the packages with upgrades waiting:
PACKAGES=$(apt-get -s dist-upgrade | awk '/^Inst/ { print $2 }' 2>&1)
#Identify the number of packages with upgrades waiting:
PACKAGECOUNT=$(echo "$PACKAGES" | wc -l)

#If there are packages with upgrades waiting, trigger this loop:
if [ "$PACKAGES" != "" ]; then
        #Send a preformatted silent failsafe curl POST request in the background with one retry attempt, passing the output into /dev/null with the notification parameters passed in and variables inserted:
        curl -X POST -fs -o /dev/null 2>&1 --retry 1 -F "title=$PACKAGECOUNT packages awaiting updates on ${HOSTNAME}" -F "message=Packages awaiting updates: $PACKAGES" -F "priority=7" "https://${BASEURL}/message?token=${TOKEN}" &> /dev/null
fi

#If there are packages which have already been installed but are awaiting reboot, trigger this loop as well:
if [ -f /var/run/reboot-required ]; then
        #Identify packages awaiting reboot:
        REBOOTREQPACKAGES=$(cat /var/run/reboot-required.pkgs)
        REBOOTREQPACKAGECOUNT=$(echo "$REBOOTREQPACKAGES" | wc -l)

        #Send a preformatted silent failsafe curl POST request in the background with one retry attempt, passing the output into /dev/null with the notification parameters passed in and variables inserted:
        curl -X POST -fs -o /dev/null 2>&1 --retry 1 -F "title=$REBOOTREQPACKAGECOUNT packages installed on ${HOSTNAME} awaiting reboot" -F "message=Packages awaiting reboot: $REBOOTREQPACKAGES" -F "priority=7" "https://${BASEURL}/message?token=${TOKEN}" &> /dev/null
fi
