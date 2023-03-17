###################################
#Summary:
#This script renames all files in the local directory to end with a specified filetype ending, doing nothing if already having the correct file type
#The script expects a single parameter input of filetype ending to be renamed to which could be supplied with or without a period

#Planned Changes:
#Maybe make this work off the working directory via cwd function instead of actual file location if deciding to not have the script copied into the working directory or changing directories in the CLI
###################################

#Import libraries:
import sys
import argparse
import os

#Confirm there was only one input parameter and handle whether it has a period (yet) otherwise stuff a relevant error message into the filename which will appear on the console window debug
if len(sys.argv) > 1:
    if len(sys.argv) < 3:
        if "." in sys.argv[1]:
            filetype = str(sys.argv[1]).replace('.', '')
        else:
            filetype = str(sys.argv[1])
    else:
        filetype = "Error: The single filetype parameter input was either invalid, not present, or not only 1 was listed"
else:
    filetype = "Error: The single filetype parameter input was either invalid, not present, or not only 1 was listed"

#String of the filetype with one dot included:
filetypeWithDot = "." + filetype

#Set the path variable to the directory where the script file is located
path = os.path.dirname(__file__)

#For all files in the current directory
for name in os.listdir(path):
    #If the file name is not the current file
    if not name == sys.argv[0]:
        #If the file does not end with the filetype desired
        if not name.endswith(filetypeWithDot):
            #Set the new name variable to the file name plus the desired file type
            newname = os.path.splitext(name)[0] + filetypeWithDot
            #Rename the existing file to the new file
            os.rename(os.path.join(path, name), os.path.join(path, newname))
    
