#!/bin/bash

# 1. Improved Discovery (Grabs the absolute newest USB device)
PORT=$(ls -t /dev/cu.usbmodem* /dev/cu.usbserial* 2>/dev/null | head -n 1)

if [ -z "$PORT" ]; then
  echo "No device found. Check System Report > USB."
  exit 1
fi

BAUD="115200"
LOGFILE="serial_log_.txt"

echo "Found: $PORT"
echo "Opening at $BAUD baud..."
exec 3<>"$PORT"
# 2. macOS-Specific stty 'Hard Reset'
# -clocal: ignores modem control lines (DTR/RTS)
# -crtscts: explicitly disables hardware flow control
# -icanon: disables line-buffering (shows data character-by-character)
stty -f "$PORT" $BAUD raw -clocal -echo icrnl

# 3. Use 'cat' but force a background flush
# Sometimes macOS needs a 'nudge' to start the stream
#(stty -f "$PORT" <&1)

cat "$PORT" | tee -a "$LOGFILE"
