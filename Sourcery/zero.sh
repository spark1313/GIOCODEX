#Write zeros to every sector of a drive:
sudo dd if=/dev/zero of=/dev/sdX bs=8M
#Verify drive has been zeroed out:
sudo dd if=/dev/sdX bs=1M status=progress | od | head


#Show badblocks info:
sudo badblocks -v /dev/sdX

#Write all zeros to a drive and confirm all bytes are zero:
sudo badblocks -svw -t 0x00 /dev/sdX
#Above but fixed for drives larger than 17TB since the byte value for badblocks is only a 32-bit integer:
sudo badblocks -svw -t 0x00 -b 8192 /dev/sdX

#Confirm all bytes written to a drive are zero'd out:
sudo badblocks -sv -t 0x00 /dev/sdX
