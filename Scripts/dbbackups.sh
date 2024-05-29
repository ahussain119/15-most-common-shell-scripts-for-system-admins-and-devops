#!/bin/bash

########################################################
# Author: Aaqib Hussain
# Date: 29/05/2024
# Description: This script will create backups of mysql databases.
# Version: 1
########################################################

username="username"
password="password"
host="localhost"
backupdir="/var/backups/mysql"
date=$(date +"%d-%b-%Y")

# Function to create a backup
create_backup() {
    # Creating the backup directory if it doesn't exist
    if [ ! -d "$backupdir" ]; then
        mkdir -p "$backupdir"
    fi

    # Getting a list of databases
    databases=$(mysql -u "$username" -p"$password" -h "$host" -e "SHOW DATABASES;" | tr -d "| " | grep -v Database)

    # Looping through each database to create a backup
    for db in $databases; do
        if [ "$db" != "information_schema" ] && [ "$db" != "performance_schema" ] && [ "$db" != "mysql" ] && [ "$db" != "sys" ]; then
            mysqldump -u "$username" -p"$password" -h "$host" "$db" > "$backupdir/$db-$date.sql"
        fi
    done
}

# Main script logic
create_backup
echo "Backup completed successfully"
