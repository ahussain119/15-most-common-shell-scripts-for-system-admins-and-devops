#!/bin/bash

#########################################################
# Author: Aaqib Hussain
# Date: 20/07/2021
# Description: This script takes two directory paths as arguments and
# synchronizes the contents of two directories.
#########################################################

# Checking if directory paths were provided
if [ $# -ne 2 ]; then
    echo "Please provide source and destination directories."
    exit 1
fi

source_dir="$1"
destination_dir="$2"

# Checking if directories exist, create if not
if [ ! -d "$source_dir" ]; then
    mkdir -p "$source_dir"
    echo "Source directory '$source_dir' was created."
fi

if [ ! -d "$destination_dir" ]; then
    mkdir -p "$destination_dir"
    echo "Destination directory '$destination_dir' was created."
fi


# Synchronize the contents of source directory to destination directory
rsync -a --ignore-existing "$source_dir/" "$destination_dir/"
rsync -a --ignore-existing "$destination_dir/" "$source_dir/"

if [ $? -ne 0 ]; then
    echo "Failed to synchronize the directories."
    exit 1
else
    echo "Directories synchronized successfully."
fi

exit 0
