#!/usr/bin/env bash

export STATUS_FILE="$XDG_RUNTIME_DIR/touchpad.status"

enable_touchpad() {
  printf "enabled" >"$STATUS_FILE"
  notify-send -u normal "Touchpad enabled"
  hyprctl keyword "\$TOUCHPAD_ENABLED" true
  hyprctl keyword device:a ''
}

disable_touchpad() {
  printf "disabled" >"$STATUS_FILE"
  notify-send -u normal "Touchpad disabled"
  hyprctl keyword "\$TOUCHPAD_ENABLED" false
  hyprctl keyword device:a ''
}

if ! [ -f "$STATUS_FILE" ]; then
  disable_touchpad
else
  if [ $(cat "$STATUS_FILE") = "enabled" ]; then
    disable_touchpad
  elif [ $(cat "$STATUS_FILE") = "disabled" ]; then
    enable_touchpad
  fi
fi
