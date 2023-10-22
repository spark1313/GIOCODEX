#Run hdparm to test read speeds of a drive (hdparm cannot test write speed):
sudo hdparm -Tt /dev/sdX

#Run badblocks test in read-only non-destructive mode:
sudo badblocks -nvs /dev/sdX

#Measure write speed with dd (Adjust blocksize bs and count as needed, if the target drive does not have a filesystem instead use of=/sdX)
#Sequential:
sudo dd if=/dev/zero of=/tmp/benchmark-test.img bs=1G count=1 oflag=dsync && sudo rm -f /tmp/benchmark-test.img
#Latency:
sudo dd if=/dev/zero of=/tmp/benchmark-test.img bs=512 count=1000 oflag=dsync && sudo rm -f /tmp/benchmark-test.img
