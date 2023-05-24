#Run a command but continue running even if disconnected, with all output sent to nohup.out in the local directory"
nohup <command>

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
