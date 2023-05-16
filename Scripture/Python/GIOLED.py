#!/bin/python3
####################################################################
#Summary:
#This is a multi-purpose script to control an LED strip
 #If a single argument of the name of a prepopulated color is passed into the script, it will change to that color
 #If no arguments are passed in and the script is called, it will try and ping a hostname specified in a variable and based on that either switch color to green, red, or no change to indicate whether the hostname is online
  #If you point this at a common website, for example Google, the LED strip can be used as an online/offline indicator
  #The script can easily be called by a cron job that runs every minute

#Future plans:
#Maybe use curl or requests to get a color variable from my website, sanitize the input, then change to that color instead of just red/green if the variable was found
 #The website colors could also be controlled from a button on the page and/or discord API
 #Could also change state from pinging internal resources so that each server has a color and if that one has issues change to that color LED like color code errors for certain outages, DNS, high CPU, high fans, high power usage, etc.
####################################################################

#Import libraries:
import time
import argparse
import sys
import os
import neopixel
import board
from rpi_ws281x import *

#Use GPIO pin 18
pin=board.D18
#Specify the strip's LED count
count=150
#Specify whether the strip is RGB, RGBW, GRB, or GRBW
order=neopixel.GRB
#Identify the hostname to measure against
hostname="thegiomancer.com"
#Specify the location of the log file to store the current LED's state
logfile = 'GIOLED_state.txt'
#Specify the brightness to set for the LEDs:
LEDbrightness = 0.3
#Static color values specified so the function can use a single parameter across different purposes instead of a tuple
greenColorValue = 0,255,0
redColorValue = 255,0,0

#Set the specified color
def setColor(c):
	strip.fill((c))
	strip.show()
#Set the specified color also flashing 3 times to indicate a state change
def setColorAndFlash(c):
	for i in range(3):
		strip.fill((0,0,0))
		strip.show()
		time.sleep(0.3)
		strip.fill((c))
		strip.show()
		time.sleep(0.3)
#Check if the current time fits into a certain time window:
def ITSTIME(b):
	#Define the start and end times in clock-style military time then convert to seconds
	startTimeWindow = ["13:13", "23:11"]
	endTimeWindow = ["13:15", "23:13"]
	timeWithinRange = False
	for i in range(len(startTimeWindow)):
		startTimeInSeconds = int(startTimeWindow[i][0:2]) * 3600 + int(startTimeWindow[i][-2:]) * 60
		endTimeInSeconds = int(endTimeWindow[i][0:2]) * 3600 + int(endTimeWindow[i][-2:]) * 60
		#Define the current time in epoch time (in seconds) and calculate the number of seconds since midnight for today's time representation in seconds
		currentLocalTime = time.localtime()
		secondsSinceMidnight = currentLocalTime.tm_hour * 3600 + currentLocalTime.tm_min * 60 + currentLocalTime.tm_sec
		#If the time fits within a certain window, return True else False
		if startTimeInSeconds <= secondsSinceMidnight <= endTimeInSeconds:
			timeWithinRange = True
	if timeWithinRange == True:
		return True
	else:
		return False

#Pass the previous variables into a named NeoPixel object
#This also specifies auto_write as False so that updating the color of the strip needs to be manually called
strip = neopixel.NeoPixel(pin,count,brightness=LEDbrightness,auto_write=False,pixel_order=order)

#If there is an argument passed into the script
if len(sys.argv) > 1:
	#Set the color based on the input argument and if the argument doesnt match a specific color populated below, set it to blank
	#If the word revert is passed in, the color and log file which is being monitored is blanked out so if the auto-detect functionality is being used that it can take back over
	if sys.argv[1] == "red":
		argcolor = 255,0,0
	elif sys.argv[1] == "green":
		argcolor = 0,255,0
	elif sys.argv[1] == "blue":
		argcolor = 0,0,255
	elif sys.argv[1] == "teal":
		argcolor = 0,255,255
	elif sys.argv[1] == "yellow":
		argcolor = 255,255,0
	elif sys.argv[1] == "magenta":
		argcolor = 255,0,255
	elif sys.argv[1] == "white":
		argcolor = 255,255,255
	elif sys.argv[1] == "orange":
		argcolor = 255,128,0
	elif sys.argv[1] == "purple":
		argcolor = 128,0,255
	elif sys.argv[1] == "gray":
		argcolor = 128,128,128
	elif sys.argv[1] == "grey":
		argcolor = 128,128,128
	elif sys.argv[1] == "revert":
		#Open the logfile in write-over mode, creating it if it does not exist, empty it out, and close the file stream
		logWrite = open(logfile, "w+")
		logWrite.write("")	
		logWrite.close()
		argcolor = 0,0,0
	else:		
		argcolor = 0,0,0

	#Set the color
	setColorAndFlash(argcolor)

#If no argument was passed into the script
else:
	#Ping the hostname once with a timeout of 2 seconds, push the result into /dev/null, and store the response
	response = os.system("ping -c 1 -w2 " + hostname + " > /dev/null 2>&1")

	#Create the log file if it does not exist and if it does, do nothing. Then close out the file stream.
	logCreate = open(logfile, "a+")
	logCreate.close()

	#Pull the current state of the LED identified in the log file, store the state, then close the file stream.
	logPull = open(logfile, "r+")
	logdata = logPull.read()
	logPull.close()

	#If the response from the ping is empty, indicating the host as online
	if response == 0:
		#If the state is already green
		if "green" in logdata:
			#If the time matches the specified value slice, set the color to red, else do nothing
			#This is done to refresh the correct LED color once a day via cron because over time the LEDs sometimes randomly change colors or turn off
			if ITSTIME(True):
				setColor(greenColorValue)
			else:
				pass
		#If the state is not already green...
		else:
			#Open the logfile in write-over mode, write the new state to it, and close the file stream
			logWrite = open(logfile, "w+")
			logWrite.write("green")	
			logWrite.close()
			#Set the color to green
			setColorAndFlash(greenColorValue)
	#If the response has a log entry, indicating the host flagging an error such as being offline
	else:
		#If the state is already red
		if "red" in logdata:
			#If the time matches the specified value slice, set the color to red, else do nothing
			#This is done to refresh the correct LED color once a day via cron because over time the LEDs sometimes randomly change colors or turn off
			if ITSTIME(True):
				setcolor(redColorValue)
			else:
				pass
		#If the state is not already red...
		else:
			#Open the logfile in write-over mode, write the new state to it, and close the file stream
			logWrite = open(logfile, "w+")
			logWrite.write("red")	
			logWrite.close()
			#Set the color to red
			setColorAndFlash(redColorValue)

####################################################################
#Reference example code syntax if needed later:
#strip[1]=(255,0,0)
#strip.setPixelColor(10, Color(255,0,0))
####################################################################
