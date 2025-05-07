#!/bin/bash

info=$(cmus-remote -Q 2>/dev/null)

if [[ $? -ne 0 ]]; then
  echo "cmus: not running"
  exit
fi

status=$(echo "$info" | grep '^status' | awk '{print $2}')
artist=$(echo "$info" | grep '^tag artist' | cut -d ' ' -f 3-)
title=$(echo "$info" | grep '^tag title' | cut -d ' ' -f 3-)

if [[ "$status" == "playing" ]]; then
  echo "🎵 $artist - $title"
elif [[ "$status" == "paused" ]]; then
  echo "⏸ $artist - $title"
else
  echo "cmus: stopped"
fi
