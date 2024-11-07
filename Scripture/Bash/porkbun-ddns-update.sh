#!/bin/bash
#############
#Notes:
#1. This is a simple straightforward script for enabling dynamic DNS via utilizing the Porkbun API to update the dynamic IP address of a DNS record if it changes
#2. Call this script via cron job on a computer in the network which you want to update the IP of the DNS record to
#3. Make the script executable via chmod a+x
#4. #Before starting, enable API Access on your Porkbun account and jot down the API key and API key secret or create if not yet existing
#Ref:
#1. https://codeberg.org/aao-fyi/porkbun-ddns-bash/src/branch/main/porkbun-ddns.sh
#2. https://github.com/mietzen/porkbun-ddns
#3. https://gist.github.com/cyrusboadway/5a7b715665f33c237996
#4. https://kb.porkbun.com/article/190-getting-started-with-the-porkbun-api
#5. https://porkbun.com/api/json/v3/documentation
#############

#Porkbun API Endpoints (these don't change unless they change their API endpoints)
DNSENDPOINT="https://api.porkbun.com/api/json/v3/dns/editByNameType"
PINGENDPOINT="https://api.porkbun.com/api/json/v3/ping"

#Edit these variables to include your values
APIKEY="pk1_apikeygoeshere"
APIKEYSECRET="sk1_itsasecret"
DOMAIN="example.com"
RECORDTYPE="A"
TTL="600"
#Note that the subdomain value here is optional here so leave it blank if not updating a subdomain
SUBDOMAIN="www"

#Send a preformatted silent failsafe curl request to the Porkbun ping API with one retry attempt, snipping your public IP from the output and storing it into a variable:
IP=$(curl -fs --retry 1 "$PINGENDPOINT" -H "Content-Type: application/json" --data "{\"apikey\": \"$APIKEY\",\"secretapikey\":\"$APIKEYSECRET\"}" | awk 'BEGIN{FS="\""}{print $8}')

#Send a preformatted silent failsafe curl request in the background with one retry attempt, passing the output into /dev/null with the variables passed in:
curl -fs -o /dev/null 2>&1 --retry 1 "$DNSENDPOINT/$DOMAIN/$RECORDTYPE/$SUBDOMAIN" -H "Content-Type: application/json" --data "{\"apikey\": \"$APIKEY\",\"secretapikey\":\"$APIKEYSECRET\",\"content\":\"$IP\",\"ttl\":\"$TTL\"}" &> /dev/null
