#!/bin/bash

################################################################
# Author:     Aaqib Hussain
# Date:       29/05/2024
# Description: This script will deploy an application to multiple servers.
# Version:    1.0
################################################################

# List of servers to deploy the application to
servers=("server1" "server2" "server3")

# Copying the application to each server and deploying it
for server in "${servers[@]}"; do
    scp "app.tar.gz" "user@$server:/tmp/"
    ssh "user@$server" "tar -xzvf /tmp/app.tar.gz -C /tmp/app"
    # Additional deployment steps app specific
done