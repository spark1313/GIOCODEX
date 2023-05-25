#Confirm disk identifier:
sudo fdisk -l

#View smartctl help if needed:
sudo smartctl -h

#View all SMART info on a SATA disk (/dev/sdc in this example):
sudo smartctl -a -d sat -c /dev/sdc
#Pluck out percent remaining for a running self-test (/dev/sdc in this example):
sudo smartctl -a -d sat -c /dev/sdc | grep remaining

#Start a SMART self-test (short, long, conveyance) (/dev/sdc in this example):
sudo smartctl -t short -d sat /dev/sdc

#Keep an already started longer test awake if using an external enclosure since they tend to time-out as the disk goes to sleep:
while true; do sudo smartctl -d sat -c /dev/sdX; sleep 90; done

#Alternative method to start a new SMART long self-test and keep it awake (/dev/sdc in this example) by watching for cumulative updates every 10 minutes:
sudo watch -d=cumulative -n 10 smartctl -t long -d sat /dev/sdc
