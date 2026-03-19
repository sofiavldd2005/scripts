#!/bin/sh

tty=$(sudo dmesg | grep ttyUSB | tail -1 | grep -o ttyUSB.)
echo "Setting up /dev/${tty}"
stty -F "/dev/${tty}" 57600 raw -clocal -echo icrnl

# Create log file with timestamp
logfile="radio_serial_data.txt"
echo "Logging to: $logfile"

# Use tee to both display in real-time and save to file
cat "/dev/${tty}" | tee "$logfile"
