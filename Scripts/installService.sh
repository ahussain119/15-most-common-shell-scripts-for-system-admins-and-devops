#!/bin/bash

################################################################
# Author:     Aaqib Hussain
# Date:       28/05/2024
# Description: This script will install a service and start it.
# Version:    1.0
################################################################

# checking if at least one argument is passed
if [ $# -eq 0 ]; then
    echo "Error: No arguments provided. Please provide the service name to install."
    exit 1
fi

# Function to update the package list
update_package_list() {
    echo "Updating package list..."
    apt update
    if [ $? -ne 0 ]; then
        echo "Error: Failed to update package list."
        exit 1
    else
        echo "Package list updated successfully."
    fi
}

# Function to check if the service is already installed
check_service() {
    if systemctl is-active --quiet $service; then
        echo "Service '$service' is already installed and running."
        exit 0
    fi
}

# Function to install the service
install_service() {
    echo "Installing the service..."
    apt install $service -y
    if [ $? -ne 0 ]; then
        echo "Error: Failed to install the service."
        exit 1
    else
        echo "Service installed successfully."
    fi
}

# Function to start the service
start_service() {
    echo "Starting the service..."
    systemctl start $service
    if [ $? -ne 0 ]; then
        echo "Error: Failed to start the service."
        exit 1
    fi
    systemctl enable $service
    echo "Service started successfully."
}

# Main script
echo "Installing and starting the services: $service"
for service in "$@"; do
    update_package_list
    check_service
    install_service
    start_service
done