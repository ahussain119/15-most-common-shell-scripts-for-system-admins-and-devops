#!/bin/bash

##################################################
# Author:     Aaqib Hussain
# Date:       27/05/2024
# Description: This script will analysis the apache2 Logs for errors and warnings in realtime.
# Version: 1
##################################################

# Path to the error log file of apache2
log_file="/var/log/apache2/error.log"

# Starting the modification time of the log file
prev_mod_time=$(sudo stat -c %Y "$logfile")

# Function to analyze the log file
analyze_log() {
    echo "============ Log Analysis Summary ============"

    # Counting errors
    count_errors=$(grep -c -Ei "Error|failed" "$log_file")

    # Counting warnings
    count_warnings=$(grep -c -Ei "Warning" "$log_file")

    # Printing final analysis report
    echo "Log file name: $(basename "$log_file")"
    echo "Total lines processed: $(wc -l < "$log_file")"
    echo "Total errors: $count_errors"
    echo "Total warnings: $warning" 
}

# Main loop to monitor the log file
echo "Monitoring log file: $log_file"
while true; do
    # Checking if the log file exists
    if [ ! -f "log_file" ]; then
        echo "Error: Log file '$log_file' not found"
        exit 1
    fi

    # Checking if the log file is readable
    if [ ! -r "log_file" ]; then
        echo "Error: Log file '$log_file' not readable"
        return 1
    fi

    # Check if the file has been modified bt comaparing the modification timestamps
    curr_mod_time=(stat -c %Y "$log_file")
    if [ $curr_mod_time -gt $prev_mod_time ]; then
        clear
        # Clearing the screen and displaying the last 10 lines of the log file
        tail -n 10 "log_file"
        analyze_log
        # Update the timestamps
        prev_mod_time=$curr_mod_time
    fi

    # Delay of 3 secong before checking again
    sleep 1
done

# Trap SIGINT (Ctrl+C) to exit gracefully
trap 'echo -e "\nExiting..."; exit 0' SIGINT