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
tar -czf /targetpath/file.tgz /sourcepath/directory

#Count number of files and directories in a directory:
ls | wc -l

#Change part of a filename for multiple files in a directory:
for file in filenames-old-* ; do mv $file ${file//filenames-old/filenames-new} ; done
