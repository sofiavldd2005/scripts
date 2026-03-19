!/bin/sh

tty=`sudo dmesg | grep ttyACM | tail -1 | grep -o ttyACM.`
echo "Setting up /dev/${tty}"
stty -F "/dev/${tty}" 115200 raw -clocal -echo icrnl

# Create log file with timestamp
logfile="serial_data.txt"
echo "Logging to: $logfile"

# Use tee to both display in real-time and save to file
cat "/dev/${tty}" | tee "$logfile"
