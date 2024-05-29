#!/bin/bash

################################################################
# Author:     Aaqib Hussain
# Date:       28/05/2024
# Description: This script will clean up the system logs and temporary files.
# Version:    1.0
################################################################

# Function to clean up system logs

# Paths to system logs and temporary files
syslogs=("var/log")
tmpfiles=("/tmp")

#older than days
days=7

# Function to clean up system logs
clean_logs() {
    echo "Cleaning up system logs..."
    for log in "${syslogs[@]}"; do
        sudo find /$log -type f -mtime +$days -exec rm -f {} \;
    done
    echo "System logs cleaned up successfully."
}

# Function to clean up temporary files
clean_tmp() {
    echo "Cleaning up temporary files..."
    for tmp in "${tmpfiles[@]}"; do
        sudo find $tmp -type f -mtime +$days -exec rm -f {} \;
    done
    echo "Temporary files cleaned up successfully."
}

# Main script
clean_logs
clean_tmp
