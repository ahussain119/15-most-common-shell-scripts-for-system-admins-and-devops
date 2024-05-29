#!/bin/bash

##################################################
# warning: this script is for educational purposes only. Do not store sensitive information in plain text files.
# Author:     Aaqib Hussain
# Date:       27/07/2024
# Description:This script will store and retrieve passwords using openssl
# Version:    1.0
##################################################


# Password file
password_file=~/.password.enc

# Check if openssl is installed, if not then installing
if ! command -v openssl &> /dev/null; then
    echo "openssl is not installed. Installing..."
    sudo apt install openssl -y
fi

# Check if the password file exists if not then creating
if [ ! -f $password_file ]; then
    echo "Password file does not exist. Creating..."
    touch $password_file
    exit 1
fi

# Function to store password
store_password() {
    echo "Enter the service name: "
    read service
    echo "Enter the username: "
    read username
    echo "Enter the password: "
    read -s password
    echo "$service $username $password" | openssl enc -aes-256-cbc -salt -out $password_file
    if [ $? -eq 0 ]; then
        echo "Password stored successfully."
    else
        echo "Failed to store password."
    fi
}

# Function to retrieve password
retrieve_password() {
    echo "Enter the service name: "
    read service
    password=$(openssl enc -d -aes-256-cbc -in $password_file | grep -w $service | awk '{print $3}')
    if [ -z $password ]; then
        echo "Password not found for the service."
    else
        echo "Password for $service is: $password"
    fi
}

# Main menu
while true; do
    echo "1. Store password"
    echo "2. Retrieve password"
    echo "3. Exit"
    read -p "Choose an option: " option
    case $option in
        1)
            store_password
            ;;
        2)
            retrieve_password
            ;;
        3)
            exit 0
            ;;
        *)
            echo "Invalid open. Please try again."
            ;;
    esac
done
