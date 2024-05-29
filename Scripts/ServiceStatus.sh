#!/bin/bash

###########################################
# Author: Aaqib Hussain
# Date: 2024-05-28
# Description: This script will check the status of the services and restart if not active
# Additions possible: Mail notification can be added if service fails to start.
###########################################

services=("apache2" "mysql" "sshd")

for service in "${services[@]}"; do
    if systemctl is-active --quiet "$service"; then
        echo "$service is running"
    else
        echo "$service is not running"
        systemctl start "$service"
        if [ $? -ne 0 ]; then
            # mail -s "Service $service failed to start" admin@company.com
            echo "Failed to start $service"
        else
            echo "$service started successfully"
        fi
    fi
done