#!/bin/sh

# when using wine,to remmap tty to COM1
tty=$(sudo dmesg | grep ttyUSB | tail -1 | grep -o ttyUSB.)
echo "Remapping /dev/${tty} to COM1"

rm ~/.wine/dosdevices/com1 && ln -s "/dev/${tty}" ~/.wine/dosdevices/com1
