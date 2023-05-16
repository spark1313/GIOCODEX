#Rename all files in a directory of a certain file extension to another:
for file in *.txt; do mv -- "$file" "${file%.txt}.NEWEXTHERE"; done
#Same as above but also for subdirectories:
find . -type f -name "*.txt" -exec rename 's/\.txt$/.NEWEXTHERE/' '{}' \;
#Same as first one but for all files extensions:
for file in *.txt; do mv -- "$file" "${file%.*}.NEWEXTHERE"; done
