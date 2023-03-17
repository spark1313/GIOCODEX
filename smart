#Smart self-test (short, long, conveyance)
sudo smartctl -t long /dev/sdX
#Keep awake if an external USB enclosure: (choose one)
while true; do sudo smartctl -d sat -c /dev/sdX; sleep 90; done
sudo watch -d--cumulative -n 10 smartctl -t long /dev/sdX
#Check smart test progress:
smartctl -A /dev/sdX | grep remaining
#Check smart test results:
sudo smartctl -l selftest /dev/sdX
