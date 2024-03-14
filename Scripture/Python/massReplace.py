###################################
#Summary:
#This script does a mass find and replace on a text file from the columns of a csv
#The script expects two parameters being the filename of the text file to find and replace and the filename of a two column csv file WITHOUT headers with the text to find in the left column and the text to replace it with in the right column
###################################

#Import libraries:
import sys, csv, argparse

#Open the text file with the file name of the first parameter as read+write at beginning of file
textfile = open(str(sys.argv[1]), "r", encoding='utf-8')
#Open the csv file with the file name of the second parameter as read only
csvfile = open(str(sys.argv[2]), 'r', encoding='utf-8')
#Open output file to write to and create if it does not yet exist which it shouldn't
outputfile = str(os.path.splitext(str(sys.argv[1])[0] + "_replaced" + str(os.path.splitext(str(sys.argv[1])[1])

#Declare array variables for finds and replaces
strings = []

#Copy the text from the text file into a text buffer then close the file stream
textdata = textfile.read()
textfile.close()

#Open the csv file for reading
csvreader = csv.reader(csvfile)
#Add each row to the strings array such that the the first dimension is each row being as long as the csv file and the second dimension having 2 values with the first being the find string and the second being the corresponding replace string
for row in csvreader:
	strings.append(row)
#Close the file stream
csvfile.close()

#For each row in the strings array
for i in range (0,len(strings)):
	#Update the text data with itself after replacing each row's find string with its replace string
	textdata = textdata.replace(str(strings[i][0]), str(strings[i][1]))

#Write the updated text data to file and close the file stream
outputfile.write(textdata)
outputfile.close()
