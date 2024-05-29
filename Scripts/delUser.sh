#!/bin/bash

##################################################
# Author:     Aaqib Hussain
# Date:       21/05/2024
# Description:This script will delete users whose username starts with the specified characters
# Version:    1.0
##################################################


# Prompt the user to enter the characters
read -p "Enter the characters: " characters

# Check if the characters are at least 4 characters long
if [[ ${#characters} -lt 4 ]]; then
    echo "Characters must be at least 4 characters long."
    exit 1
fi

# Get a list of all users
users=$(awk -F':' '{ print $1}' /etc/passwd)
if [ $? -ne 0 ]; then
    echo "Failed to get the list of users."
    exit 1
fi

# Loop through each user
for user in $users; do
    # Check if the username starts with any of the specified characters
    # ${user:0:${#characters}} extracts the first n characters of the username, where n is the length of the characters
    if [[ "${characters}" == "${user:0:${#characters}}" ]]; then
        # Delete the user and their home directory
        sudo userdel -r "$user" 2> /dev/null
        if [ $? -ne 0 ]; then
            echo "Failed to delete user: $user"
        else
            echo "Deleted user: $user"
        fi
    fi
done