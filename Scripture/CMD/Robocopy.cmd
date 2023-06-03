robocopy "C:\source" "D:\destination" /MIR /FFT /XJD /R:3 /W:1 /V /FP /X /NP /ETA /TEE /COPY:DT /DCOPY:T /LOG+:"C:\Users\%USERNAME%\Desktop\Robocopy-Backup-Log-%date:~4,2%.%date:~7,2%.%date:~10,4%".txt
#Note: Parameters were chosen for best compatibility with Unraid and Windows 7

#Explanation of potential useful flags:
# /MIR :: Mirror a directory tree, equivalent to /E (Copy subdirectories, including the empty ones.) plus /PURGE (Delete dest files/dirs that no longer exist in the source.)
# Note that this also overwrites security settings in the destination if already existing instead of skipping.
# /FFT :: Assume FAT file times (2-second granularity).
# /XJD :: Exclude junction points for directories (aka My Music, My Documents)
# /R:n :: Number of retries on failed copies: default 1 million.
# /W:n :: Wait time between retries: default is 30 seconds.
# /V :: Produce verbose output, showing skipped files.
# /FP :: Include full pathname of files in the output.
# /X :: Report all extra files, not only those selected.
# /NP :: No progress - don't display percentage copied. (as to not clog up the log file)
# /ETA :: Show estimated time of arrival of copied files.
# /TEE :: Output to console window and the log file.
# /COPY:T :: What to COPY for files (default is /COPY:DAT). (copyflags: D=Data, A=Attributes, T=Timestamps, S=Security=NTFS ACLs, O=Owner info, U=aUditing info).
# Note: Windows 10 and greater can use DAT without issue but Unraid will likely have issues with attributes
# /DCOPY:T :: What to copy for directories (default is /DCOPY:DA). (copyflags : D=Data, A=Attributes, T=Timestamps, E=EAs, X=Skip alt data streams).
# Note: Windows 10 and greater can use DAT without issue but Unraid will likely have issues with attributes
# /LOG+"" :: Output status to LOG file (append to existing log).
# /XD :: F:\Directory at the end to exclude a directory
# /Z :: Copy in Restart mode in case interrupted files can continue
# /B :: Copy files in backup mode for files in use.
