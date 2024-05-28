#!/bin/bash

##################################################
# Author:     Aaqib Hussain
# Date:       21/05/2024
# Description:This script will create a tar file of the folder specified by the user
# Version:    1.0
##################################################

# Check if the user has provided an argument, $# is the number of arguments passed to the script, $0 is the script name
if [ $# -eq 0 ]; then
    echo "$0 requires the folder name as an argument to make an archive of it."
    exit 1
fi

# Check if the directory exists, ! is the negation operator, -d is a test operator to check if the directory exists.
if [ ! -d "$1" ]; then
    echo "$1 directory does not exist."
    exit 1
fi

# Verify if the backup directory exists, if not create it, -p is to create the parent directories if they don't exist
if [ ! -d "$HOME/backup" ]; then
    mkdir -p "$HOME/backup"
    if [ $? -ne 0 ]; then # $? is the exit status of the last command
        echo "Failed to create backup directory."
        exit 1
    fi
fi

# Create the tar file and gzip it in one step using tar, c for create, z for gzip, v for verbose, f for file, $1 is the first argument passed to the script, $(date +%Y%m%d%H%M%S) is the current date and time
tar czvf "$HOME/backup/$1-$(date +%Y%m%d%H%M%S).tar.gz" "$1"
if [ $? -ne 0 ]; then
    echo "Failed to create the archive."
    exit 1
fi

# Let the user know the process is complete
echo "Backup of $1 completed"

exit 0
