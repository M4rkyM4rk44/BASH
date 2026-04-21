#!/usr/bin/env bash

# Variables.
D=$(date +%Y%m%d) # Todays date.

# Close all instances of Brave to properly backup.
killall brave

# Create backup.
cp -r /home/$USER/.config/BraveSoftware/Brave-Browser ./
zip -rT ./BraveBackup_$D ./Brave-Browser
rm -fr ./Brave-Browser
