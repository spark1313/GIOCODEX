# Summary:
This is a collection of scripts and CLI copy pastas all in one place for easy reference:

# Scripts:
### [GIOLED](GIOLED.py)
* This is a multi-purpose Python script to control an LED strip (WS2812B) ran off a Raspberry Pi via GPIO pins
  * If ran with a single argument of a color name, it changes the LED strip to that color
  * If ran with no arguments, it pings a host and changes to green or red to indicate uptime
  * The script can easily be called from a cron job that runs every minute to act as an interage outage detector
     * A cool use-case is for LED strip lights in a server rack.
* Examples:

          sudo python GIOLED.py purple
          sudo python GIOLED.py
          * * * * * root python /home/user/Desktop/GIOLED.py

### [GioRenamer](GioRenamer.py)
* This is a Python script which renames all files in the local directory to end with a specified filetype ending, doing nothing if already having the correct file type
  * The script expects a single parameter of filetype extension to be renamed to which could be supplied with or without a period
* Example:

          sudo python GioRenamer.py jpg
          
### [fileSizeCompare](fileSizeCompare.bat)
* This is a Batch script which prints a list of file names in a directory and all contained subdirectories which have identical file sizes to other files in those directories/subdirectories so essentially a deduplication discovery


# CLI:
### [Robocopy](Robocopy.cmd)
* Windows CLI using robocopy to selectively sync files between drives and NAS on Windows
   * The parameters have been optimized for best compatibility with Windows 7 and Unraid which handle attribute and security issues
### [Renaming](Renaming.sh)
* Linux CLI to selectively rename groups of files
### [Smart Testing](smart.sh)
* Linux CLI using smartctl to check drive SMART stats and run tests
### [Drive Wiping with dd](dd.sh)
* Linux CLI using dd to wipe a drive and verify


# Fixes:
### [Fixes](Fixes)
* Here are assorted fixes for issues that usually do not involve CLI or scripts
