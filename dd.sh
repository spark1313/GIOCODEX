#Write zeros to every sector of a drive:
dd if=/dev/zero of=/dev/sdX bs=8M
#Verify drive has been zeroed out:
sudo dd if=/dev/sdX bs=1M status=progress | od | head
