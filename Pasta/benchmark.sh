#Run hdparm to test read speeds of a drive (hdparm cannot test write speed):
sudo hdparm -Tt /dev/sdX

#Run badblocks test in read-only non-destructive mode:
sudo badblocks -nvs /dev/sdX

#Insert here steps with dd
