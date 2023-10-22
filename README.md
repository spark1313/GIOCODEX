# The Codex of The Giomancer:
You have uncovered the Codex of The Giomancer! Rumor says the hidden knowledge that lies within rival even that of the Install Wizard. This is the Table of Contents.

# Chapter 1: Spellcraft
Giomancy spellcraft containing an assortment of knowledge such as documented solutions to issues for reference, lessons learned, and first-hand experience to bolster your wisdom. They say that forum posts eventually get lost in the ether one day...but codices are eternal.

### [Spellcraft.txt](Spellcraft.txt)

# Chapter 2: Sourcery
So let it be written, so let it be done. Sourcery inscribed into these pages shall be materialized elsewhere. This is a collection of useful CLI Copy Pastas for quick reference so I don't have to go read the man page and reinvent them again.

### [Prequel](Sourcery/prequel.sh)
* The prequel to the pasta. Shell commands interacting with SQL DBs which are themselves not direct SQL queries are catalogged here
### [Spices](Sourcery/spices.sh)
* Can't eat pasta without proper seasoning and spices. Assortment of useful commands but not significant enough to be in their own listing
### [Hotkeys](Sourcery/hotkeys.txt)
* The cooking vessel must get hot enough to boil the water. Wait, you made the keys hot instead?
### [Renaming](Sourcery/renaming.sh)
* Linux CLI to selectively rename groups of files
### [Smart Testing](Sourcery/smart.sh)
* Linux CLI using smartctl to check drive SMART stats and run tests
### [Drive Wiping](Sourcery/zero.sh)
* Linux CLI commands to wipe a drive and verify
### [Drive Benchmarking](Sourcery/benchmark.sh)
* How fast does pasta cook? Well, let's run a benchmark. These are commands to run benchmarks on a drive
### [Drive Recovery](Sourcery/ddr.sh)
* Cookware busted? Can't dance? Try and recover hard drive data with ~~ddr_help~~ dd_rhelp
### [SeekAndDestroy](Sourcery/seekAndDestroy.sh)
* Find files of a certain criteria and delete them
### [Sequel](Sourcery/sequel.sql)
* The sequel to the pasta - you might be a Pastafarian at this point. SQL queries interacting with DBs are catalogged here

# Chapter 3: Scripture
Incantations crafted and written into these pages may be read to expedite manual invocation of individual fragments of Giomancy. Different schools of Giomancy have their own sections.

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
          
### [fileSizeCompare](Scripture/Batch/fileSizeCompare.bat)
* This is a Batch script which prints a list of file names in a directory and all contained subdirectories which have identical file sizes to other files in those directories/subdirectories so essentially a deduplication discovery

### [PullContent](Scripture/JavaScript/PullContent.js)
* This is an HTML and JavaScript code snipped which pulls content from an external file and embeds it in the page

### [LastUpdatedJSDate](Scripture/JavaScript/LastUpdatedJSDate.js)
* This is an HTML and JavaScript code snippet which pulls the last updated date of an external file and embeds it in the page

### [Robocopy](Scripture/CMD/Robocopy.cmd)
* Windows CLI using robocopy to selectively sync files between drives and NAS on Windows
   * The parameters have been optimized for best compatibility with Windows 7 and Unraid which handle attribute and security issues

# [Appendix](appendix.txt)
The appendix written by my first apprentice as they began to dabble into spellcraft.
