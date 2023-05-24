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
alias roflcopter="echo soisoisoisoisoi"

#Make a symlink:
ln -s /path/where/shortcut/goes shortcut

#Rsync push to transfer files between Linux systems or Windows and Linux via SSH:
rsync -vP --rsh=ssh <filename>.<extension> <target username>@<target hostname>:/path/to/target/directory/<filename>.<extension>

#Shell hotkeys:
#Go to beginning of line:
ctrl+a
#Go to end of line:
ctrl+e

##Vi hotkeys:
#Go to top of file:
gg
#Go to bottom of file:
shift+g
#Delete a line:
dd
