# [Chapter 3: Scripture](.)
Incantations crafted and written into these pages may be read to expedite manual invocation of individual fragments of Giomancy.
Different schools of Giomancy have their own sections.

## [Section 1: Python](Python)  

### [GIOLED](Scripture/Python/GIOLED.py)
* This is a multi-purpose Python script to control an LED strip (WS2812B) ran off a Raspberry Pi via GPIO pins
  * If ran with a single argument of a color name, it changes the LED strip to that color
  * If ran with no arguments, it pings a host and changes to green or red to indicate uptime
  * The script can easily be called from a cron job that runs every minute to act as an interage outage detector
     * A cool use-case is for LED strip lights in a server rack.
* Examples:

          sudo python GIOLED.py purple
          sudo python GIOLED.py
          * * * * * root python /home/user/Desktop/GIOLED.py

### [GioRenamer](Scripture/Python/GioRenamer.py)
* This is a Python script which renames all files in the local directory to end with a specified filetype ending, doing nothing if already having the correct file type
  * The script expects a single parameter of filetype extension to be renamed to which could be supplied with or without a period
* Example:

          sudo python GioRenamer.py jpg
          

<br>

## [Section 2: Batch](Batch)  

### [fileSizeCompare](Scripture/Batch/fileSizeCompare.bat)
* This is a Batch script which prints a list of file names in a directory and all contained subdirectories which have identical file sizes to other files in those directories/subdirectories so essentially a deduplication discovery

<br>

## [Section 3: Bash](Bash)  

### [rsync](Bash/rsync.sh)
* Pre-populated rsync for syncing stuff between servers

<br>

## [Section 4: JavaScript](JavaScript)  

### [PullContent](Scripture/JavaScript/PullContent.js)
* This is an HTML and JavaScript code snipped which pulls content from an external file and embeds it in the page

### [LastUpdatedJSDate](Scripture/JavaScript/LastUpdatedJSDate.js)
* This is an HTML and JavaScript code snippet which pulls the last updated date of an external file and embeds it in the page

<br>

## [Section 5: Windows CMD](CMD)  

### [Robocopy](Scripture/CMD/Robocopy.cmd)
* Windows CLI using robocopy to selectively sync files between drives and NAS on Windows
   * The parameters have been optimized for best compatibility with Windows 7 and Unraid which handle attribute and security issues
