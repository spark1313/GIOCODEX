#Ref: http://www.kalysto.org/utilities/dd_rhelp/index.en.html

#Download and extract tar: (Update numbering to latest version at the time)
tar xzvf dd_rhelp-0.0.6.tar.gz
cd dd_rhelp-0.0.6

#Build it:
./configure
make
make install

#The software is now intalled under "/usr/local/bin/dd_rhelp"

#Check version:
dd_rhelp --version

#Rip disk to image:
dd_rhelp /dev/sdX /directory/path/rescueAttempt.img

#Alternatively, dd can be used directly for this to write contents out to a file. You can tell it to copy all the good data off the drive, then you can run it a few more times to go and try harder (i.e., use smaller block sizes) trying to pull data off the bad areas.
