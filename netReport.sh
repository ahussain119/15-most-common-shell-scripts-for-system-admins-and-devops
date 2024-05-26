#!/bin/bash

###########################################
# Author: Aaqib Hussain
# Date: 20/07/2021
# Description: This script will check the network information
# Version: 1.0
###########################################

# Get the IP addresses (excluding loopback and docker)
ip_addresses=$(ip addr show | awk '/inet / && !/127.0.0.1|docker/ {print $2}')

# Get the default gateway
default_gateway=$(ip route | awk '/default/ {print $3}')

# Get the DNS servers using nmcli
dns_servers=$(nmcli device show | awk '/IP4.DNS/ {print $2}' )


# Print the net report
echo "Net Report:"
echo "-----------"
echo "IP Addresses:    $ip_addresses"
echo "Default Gateway: $default_gateway"
echo "DNS Servers:     $dns_servers"