#!/bin/bash
device="ASUE120A:00 04F3:319B Touchpad"
enabled=$(xinput --list-props "$device" | grep "Device Enabled" | awk '{print $NF}')

if [[ "$enabled" == "1" ]]; then
  xinput --disable "$device"
else
  xinput --enable "$device"
fi
