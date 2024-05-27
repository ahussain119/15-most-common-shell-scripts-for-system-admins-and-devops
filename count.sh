#!/bin/bash

#################################################
# Author: Aaqib Hussain
# Date: 20/07/2021
# Description: This script will count the number of files in the current directory
# Version: 1.0
#################################################

# Count the number of files in the specified directory

# Check if the user has provided a directory
if [ $# -eq 0 ]; then
    echo "Please provide a directory"
    exit 1
fi

# Check if the provided directory exists
if [ ! -d $1 ]; then
    echo "Directory does not exist"
    exit 1
fi

# Count the number of files in the directory
file_count=$(ls -l $1 | grep ^- | wc -l)

# Print the number of files in the directory
echo "Number of files in $1: $file_count"