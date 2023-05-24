#Run a command but continue running even if disconnected, with all output sent to nohup.out in the local directory"
nohup <command>

#Follow a log file line-by-line as it is generated
tail -f file.log

#Download something from the web (with the optional -O argument to specify a different filename for the downloaded file)
wget -O newname.zip https://URL.domain/file.zip --progress=bar:force:noscroll
