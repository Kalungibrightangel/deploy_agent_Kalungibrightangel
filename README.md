# deploy_agent_Kalungibrightangel
This repository contains a shell script that automates the creation of  workspace, configures settings via the command line, and handles system signals gracefully.

Attendance Tracker Setup Script
This Bash script automates the setup of an attendance tracker project directory. It creates the required folder structure, moves sourcecode files into their designated locations, allows the user to update threshold values in the configuration file,  a signal trap to safely archive and clean up the project if interrupted and ensures Python3 is successfully installed.

Features of the script

Directory Creation: Builds a main project directory with Helpers and reports subdirectories.

File Organization: Moves source files (attendance_checker.py, assets.csv, config.json, reports.log) into the correct subfolders.

Threshold Update: Prompts the user to optionally update attendance threshold values (failure and warning) in config.json.

Signal Trap: Catches SIGINT (Ctrl+C) and archives the current state of the project before deleting incomplete directories.

Health Check: Verifies that Python3 is installed using python3 --version.

Usage

Save the script as setup_project.sh

Make it executable:

chmod +x setup_project.sh

Run the script:

./setup_project.sh

Follow the prompts:

Enter a directory name.

Choose whether to update threshold values.

Provide new values if required.

Directory Structure

After execution, the project will look like this:

attendance_tracker_<directory>/
├── attendance_checker.py
├── Helpers/
│   ├── assets.csv
│   └── config.json
└── reports/
    └── reports.log

Signal Handling

If the user presses Ctrl+C during execution:

The script archives the current state into attendance_tracker_<directory>_archive

Deletes the incomplete directory.

Exits cleanly.

Requirements

Bash shell

Python3 installed and accessible via python3 --version

Notes

Always run the script from the directory containing the source files (attendance_checker.py, assets.csv, config.json, reports.log)

Below is the youtube link that provides more information about the script.
https://youtu.be/aN8Pp4BAwfE
