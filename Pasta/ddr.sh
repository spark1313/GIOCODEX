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
