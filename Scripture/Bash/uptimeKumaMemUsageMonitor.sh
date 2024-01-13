#!/bin/bash

#Grab the total memory plus swap and free memory plus swap for the system from the Total row and select the respective items then calculate the percentage free:
#Note: If you don't want to include swap in the calculation, change the grep target to Memory instead
TOTALMEMPLUSSWAP=`free -t -m | grep Total | awk '{print $2;}'`
FREEMEMPLUSSWAP=`free -t -m | grep Total | awk '{print $4;}'`
PERCENTMEMPLUSSWAPFREE=$((100*$FREEMEMPLUSSWAP/$TOTALMEMPLUSSWAP))

#Input your Uptime Kuma base URL here as well as the app token:
BASEURL='kuma.domain.com'
TOKEN='H4HG0771M'

#Message options for when disk usage is above or below threshold, reporting up or down accordingly:
UPMESSAGE="Mem%20free%20is%20normal:%20${PERCENTMEMPLUSSWAPFREE}%25"
DOWNMESSAGE="Mem%20free%20is%20low:%20${PERCENTMEMPLUSSWAPFREE}%25"

#Based on whether the value of percent memory free is greater than 10 percent or not, send out a preformatted silent failsafe curl with variables inserted and return output into /dev/null:
if (($PERCENTMEMPLUSSWAPFREE >= 10)); then
  curl -fs -o /dev/null --retry 1 "https://$BASEURL/api/push/$TOKEN?status=up&msg=$UPMESSAGE"
else
  curl -fs -o /dev/null --retry 1 "https://$BASEURL/api/push/$TOKEN?status=down&msg=$DOWNMESSAGE"
fi
