#!/bin/bash

##################################################
# Author:     Aaqib Hussain
# Date:       20/07/2021
# Description:This script will create a new user with a generated username and password
# Version:    1.0
##################################################

# Check if both first name and last name are provided
if [ $# -lt 2 ]; then
    echo "Usage: $0 <first_name> <last_name> [sudo_access]"
    exit 1
fi

# Extract the first letter of the first name and last name
first_letter_first_name="${1:0:1}"
first_letter_last_name="${2:0:1}"

# Generate a random string
random_string=$(cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 3 | head -n 1)

# Concatenate the first letter of the first name, 0, first letter of the last name, 0, and the random string
username="${first_letter_first_name,,}0${first_letter_last_name,,}0${random_string}"

# Generate a random 6-digit password
password=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)

echo "Generated username: $username"
echo "Generated password: $password"

# Create the user with the generated username and set the password
sudo useradd -m "$username"
if [ $? -ne 0 ]; then
    echo "Failed to create user $username"
    exit 1
fi

echo "$username:$password" | sudo chpasswd
if [ $? -ne 0 ]; then
    echo "Failed to set password for user $username"
    exit 1
fi

# Prompt the user to change the password at first login
sudo chage -d 0 "$username"


# Check if sudo access is provided
if [ "$3" == "S" ]; then
    # Add the user to the sudo group
    sudo usermod -aG sudo "$username"
    if [ $? -ne 0 ]; then
        echo "Failed to add user $username to sudo group"
        exit 1
    fi
    echo "User $username with Sudo access was created successfully"
else
    echo "User $username was created successfully without Sudo access"
fi