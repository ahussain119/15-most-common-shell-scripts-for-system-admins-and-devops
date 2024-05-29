#!/bin/bash

##################################################
# Author:     Aaqib Hussain
# Date:       27/05/2024
# Description: This script will monitor the system resources.
# Version:    1.0
##################################################

# Setting thresholds
cpu_threshold=80
memory_threshold=90

while true; do
    # Get CPU usage
    cpu_usage=$(top -bn1 |  awk '/Cpu/ { printf $2 + $4}')

    # get memory usage
    memory_usage=$(free | awk 'NR==2{printf "%.2f%%", ($3/$2)*100}')

    # Check if CPU usage exceeds threshold
    if (( $(echo "$cpu_usage > $cpu_threshold" | bc -l) )); then
        echo "High CPU usage detected: $cpu_usage%"
    fi

    # Check if memory usage exceeds threshold
    if (( $(echo "${memory_usage%?} > $memory_threshold" | bc -l) )); then
        echo "High memory usage detected: $memory_usage"
    fi

    # Sleep for 5 seconds
    sleep 5
done


