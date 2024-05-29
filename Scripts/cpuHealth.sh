#!/bin/bash

##################################################
#Author:     Aaqib Hussain
#Date:       21/05/2024
#Description:This script will check the CPU, Memory, Storage, Uptime and Top Processes
#Version:    1.0
##################################################

# Check CPU usage, -b is to run top in batch mode, -n1 is to run only once, awk to print plus of $2 and $4, $2 is the second column, $4 is the fourth column
cpu_usage=$(top -bn1 |  awk '/Cpu/ { printf $2 + $4}')
echo "CPU Usage: $cpu_usage%"


# Check memory usage, free displays the memory usage, NR=2 to get the second row, %.2f to print the float with 2 decimal, $3 is used memory, $2 is total memory
memory_usage=$(free | awk 'NR==2{printf "%.2f%%", ($3/$2)*100}')
echo "Memory Usage: $memory_usage"



# Check storage usage, df is a command to display disk space usage, $NF is the last field, $5 is the fifth column, %s is to print the string
storage_usage=$(df / | awk 'NR==2{printf "%s", $5}')
echo "Storage Usage: $storage_usage"


# Check system uptime
uptime=$(uptime -p )
echo "System Uptime: $uptime"

# Check processes causing high resource usage, -eo is to specify the output format, --sort is to sort the output, head -n 6 to get the top 5 processes
top_processes=$(ps -eo comm,pid,%cpu,%mem,user --sort=-%cpu,-%mem | head -n 6)
echo "Top Processes:"
echo "$top_processes"