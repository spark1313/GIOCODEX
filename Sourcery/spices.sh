#Run a command in the background:
<command> &

#Run one command onlt and after another finishes:
<command1> && <command2>

#Combination of above two:
$(command1 && command2) &

#Run a command but continue running even if disconnected, with all output sent to nohup.out in the local directory"
nohup <command>

#Run a nohup command in the background:
nohup <command> &

#Follow a log file line-by-line as it is generated
tail -f file.log

#Download something from the web (with the optional -O argument to specify a different filename for the downloaded file)
wget -O notavirus.zip.jpg.exe https://URL.domain/file.zip --progress=bar:force:noscroll

#Where yum repos are located:
/etc/yum.repos.d

#Find that one thing you typed that one time but only vaguely remember part of it:
history | grep keyword

#Make an alias: (add these in your shell's source file such as /etc/profile for all users bash)
alias ll="ls -lath"

#Make a symlink:
ln -s /path/where/shortcut/goes shortcut

#Rsync push to transfer files between Linux systems or Windows and Linux via SSH:
rsync -vP --rsh=ssh <filename>.<extension> <target username>@<target hostname>:/path/to/target/directory/<filename>.<extension>

#Do math in the terminal so you dont have to open a calculator to do quick math: (make sure you put spaces between the numbers)
expr 13 + 13

#Print file list:
ls | awk ' {print $NF}'

#Compute hashes in Windows:
certutil -hashfile file_name SHA512

#Enable a versioned software in Amazon Linux:
amazon-linux-extras enable postgresql14

#Find your java bin and version:
readlink -f $(which java)

#Switch Java version if more than one version installed on the OS:
update-alternatives --config java

#Show datestamps for commands in history:
vi /etc/profile
Add this environment variable line: HISTTIMEFORMAT="%Y/%m/%d-%T: "
source /etc/profile

#Execute a Confluence Server SOAP JSON-RPC API call check:
https://<instance-name>/rpc/soap-axis/confluenceservice-v2?wsdl
#Rename a user with Confluence Server SOAP JSON-RPC API call:
curl --user "auth username":"auth password" -H "Content-Type: application/json" -H "Accept: application/json" -X POST -d '{"jsonrpc":"2.0", "method":"renameUser", "params":["username_being_renamed", "new_username"], "id":13}' https://<instance-URL>/rpc/json-rpc/confluenceservice-v2?os_authType=basic

#Insert the current date to a filename in Linux: (insert inline)
/directory/path/file-name-$(date +"%Y.%m.%d").txt

#Check what shell you are running:
echo $SHELL / echo $0

#Tar gzip a directory:
tar -czvf /target/dir/archive.tar.gz /source/dir

#tar un-gzip a directory:
tar -xzvf /source/dir/archive.tar.gz -C /target/dir/

#Count number of files and directories in a directory:
ls | wc -l

#Change part of a filename for multiple files in a directory:
for file in filenames-old-* ; do mv $file ${file//filenames-old/filenames-new} ; done

#List files in a directory but show the size of directories not as just 4.0K but as the size of all of their recursive files: (pick one)
find . -maxdepth 1 -printf "%M %u %g %kKB %T+ %p\n" | sort | column -t
find . -maxdepth 1 -printf "%M %u %g %T+ " -exec du -h {} \; | column -t | sort
(du -h --max-depth=1; ls -lh) | awk '{ if($1 == "total") {X = 1} else if (!X) {SIZES[$2] = $1} else { sub($5 "[ ]*", sprintf("%-7s ", SIZES["./" $9]), $0); print $0} }' | column -t
(du -h --max-depth=1; ls -lh) | awk '{ if($1 == "total") {X = 1} else if (!X) {SIZES[$2] = $1} else { printf("%11s %4s %-6s %-6s %7s %3s %2s %5s %s\n", $1, $2, $3, $4, SIZES["./" $9], $6, $7, $8, $9) } }' | sort --key=5,5h
ls -l | gawk 'substr($1,1,1)=="d"{("du -bs " $NF) | getline size split(size,size_) sub($5,size_[1],$5)} { printf "%s %2s %s %s %10s %s %s %s %s\n",$1,$2,$3,$4,$5,$6,$7,$8,$9}' | column -t

#Override TMOUT timeout environment variable when set to readonly:
exec env TMOUT=0 bash

#How to transfer files from Windows to Linux using just Putty via cmd:
pscp "C:\path\dir\file.extension" userid@server_name:/path/destination/directory/file.extension

#List currently running kernel version
uname -r

#Update grub:
grub2-mkconfig -o /boot/grub2/grub.cfg
#EFI update grub:
grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg

#Run a jar
java -jar /dir/path/file.jar

#fstab config for mounting a CIFS share
//10.0.0.1/smbshare /mnt/cifsshare cifs credentials=/etc/samba/.smbcredentials,username=smbusername,uid=osusername,gid=root,rw,file_mode=0777,dir_mode=0777,_netdev 0 0

#Install a DE GUI:
yum groupinstall gnome-desktop x11 fonts -y
systemctl set-default graphical.target
reboot

#Set hostname:
hostnamectl set-hostname hostname --static

#Add alternative package repos to RHEL based systems:
yum install epel

#Open xkill:
ctrl+alt+escape
#Kill a thing
killall plasmashell
#Restart plasma shell
kstart plasmashell

#DNF package manager:
#Update:
dnf update
#Upgrade OS:
dnf upgrade
#Uninstall:
dnf remove packagename
#Upgrade a package:
dnf upgrade packagename
#Update a package
dnf update packagename
#List if packages installed:
dnf list packagename
#List packages by repository
dnf repository-packages repositoryname info
#Install package:
dnf install packagename
#Install package specific version
dnf install packagename-version-release
#Download RPM for package without installing it:
dnf download packagename
#List Desktops Could Install:
dnf grouplist -v
#Install new desktop:
dnf install @mate-desktop-environment
#Install new desktop applications:
dnf install @mate-applications
#Clean cache:
dnf clean all
#Search for a package:
dnf search packagename

#Yum package manager:
#Update:
yum update -y
#Install package and skip broken:
yum install -y --skip-broken
