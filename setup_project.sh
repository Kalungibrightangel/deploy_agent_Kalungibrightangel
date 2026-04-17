#!/bin/bash
#Prompting the user to enter any name of the name of the direcory that they want.
read -p "Enter name of directory " directory

#Creating the desired user directory.
mkdir -p attendance_tracker_$directory

#Creating sub-directories under the user directories
mkdir -p attendance_tracker_$directory/Helpers
mkdir -p attendance_tracker_$directory/reports

#moving the source code files from the current directory to the newly created directories.
mv attendance_checker.py attendance_tracker_$directory
mv assets.csv attendance_tracker_$directory/Helpers
mv config.json attendance_tracker_$directory/Helpers
mv reports.log attendance_tracker_$directory/reports

#Prompting the user to choose if they want to change the attendance threshhold values.
read -p "Do you want to change the attendance threshhold, write YES or NO " answer

#Taking new values from the user and replacing the old ones.
if [ "$answer" = "YES" ]; then
    read -p "Enter new failure value " failure
    read -p "Enter new warning value " warning

    sed -i "s/50/$failure/g" attendance_tracker_$directory/Helpers/config.json
    sed -i "s/75/$warning/g" attendance_tracker_$directory/Helpers/config.json
fi

#Trapping the SIGINT signal, Archiving the unfinished directory and deleting the incomplete directory.
trap ' echo "Exiting the process, archive file being made.."; tar -cf attendance_tracker_$directory_archive attendance_tracker_$directory; rm -r attendance_tracker_$directory; exit 1 ' SIGINT

#Checking if python3 is installed on the local sysytem
if python3 --version &>/dev/null; then
    echo "Python3 is installed"
else
    echo "Warning: Python3 is not installed. Please install it before continuing."
    exit 1
fi
