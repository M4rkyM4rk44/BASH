#!/usr/bin/env bash

# Get URL to shorten
clear
echo '=====URL Shortner====='
echo ''
read -p 'URL to shorten: ' URL

# Shorten URL
SHORT=$(curl 'https://is.gd/create.php?format=simple&url='$URL)

# Display new URL
clear
echo '=====URL Shortner====='
echo ''
echo '$URL has been shortened to:' $SHORT
echo ''
read -p "Press any key to exit the script..."
clear
