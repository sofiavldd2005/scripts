#!/bin/bash

# Check for root privileges
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (sudo)"
  exit
fi

# Configuration - Change these to match your needs
CONNECTION_NAME="Hotspot" # The name of your Wi-Fi hotspot connection
NEW_IP="192.168.50.1"     # The static IP you want for the PC
SUBNET_MASK="24"          # Equivalent to 255.255.255.0

echo "Updating Hotspot IP to $NEW_IP..."

# 1. Set the manual IPv4 address
nmcli connection modify "$CONNECTION_NAME" ipv4.addresses "$NEW_IP/$SUBNET_MASK"

# 2. Set the method to shared (required for Hotspots)
nmcli connection modify "$CONNECTION_NAME" ipv4.method shared

# 3. Restart the connection to apply changes
echo "Restarting connection..."
nmcli connection down "$CONNECTION_NAME"
nmcli connection up "$CONNECTION_NAME"

echo "Success! Your Ground Station IP is now $NEW_IP"
echo "Teammates should connect to: http://$NEW_IP:3000"
