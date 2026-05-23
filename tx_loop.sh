#!/bin/bash

# --- Configuration ---
PORT="/dev/ttyUSB0"
BAUD="57600"        # Change this to match your discovered baud rate
BYTE_TO_SEND="\x41" # Hex for 'A'
DELAY=0.05          # Delay in seconds between transmissions

# --- Port Setup ---
echo "Configuring $PORT at $BAUD baud..."
# Suppress error output in case of permission issues before testing
stty -F "$PORT" "$BAUD" raw -echo -echoe -echok

# Check if stty succeeded
if [ $? -ne 0 ]; then
  echo "Error: Could not configure $PORT. Check permissions or connection."
  exit 1
fi

echo "Port configured successfully."
echo "Starting continuous transmission. Press [Ctrl+C] to stop."
echo "------------------------------------------------------"

# --- Transmission Loop ---
counter=1

while true; do
  # Send the raw byte to the serial port
  printf "$BYTE_TO_SEND" >"$PORT"

  # Print a status update to your terminal screen
  echo "Sent byte: $BYTE_TO_SEND | Count: $counter"

  # Increment counter and wait
  counter=$((counter + 1))
  sleep "$DELAY"
done
