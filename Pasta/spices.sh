#Run a command but continue running even if disconnected, with all output sent to nohup.out in the local directory"
nohup <command>

#Follow a log file line-by-line as it is generated
tail -f file.log

#Download something from the web (with the optional -O argument to specify a different filename for the downloaded file)
wget -O newname.zip https://URL.domain/file.zip --progress=bar:force:noscroll

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
