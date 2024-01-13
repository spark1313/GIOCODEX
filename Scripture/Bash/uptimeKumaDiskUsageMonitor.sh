#!/bin/bash

#Run a df on the current disk, cut off the fiirst line, select the 5th item, and trim the percent sign off:
DISKUSAGE=`df -kh . | tail -n1 | awk '{print $5}' | tr -d "%"`

#Input your Uptime Kuma base URL here as well as the app token:
BASEURL='kuma.domain.com'
TOKEN='H4HG0771M'

#Message options for when disk usage is above or below threshold, reporting up or down accordingly:
UPMESSAGE="Disk%20Usage%20is%20normal:%20${DISKUSAGE}%25"
DOWNMESSAGE="Disk%20Usage%20is%20high:%20${DISKUSAGE}%25"

#Based on whether the value of percent disk usage is less than 88 or not, send out a preformatted silent failsafe curl with variables inserted and return output into /dev/null:
if (($DISKUSAGE <= 88)); then
  curl -fs -o /dev/null --retry 1 "https://$BASEURL/api/push/$TOKEN?status=up&msg=$UPMESSAGE"
else
  curl -fs -o /dev/null --retry 1 "https://$BASEURL/api/push/$TOKEN?status=down&msg=$DOWNMESSAGE"
fi
