#!/usr/bin/env bash

# Make sure curl is installed

# Script
clear
echo "=====Get Public IP====="
echo ""
p=$(curl -s https://icanhazip.com)
echo "Public IP is: " $p
echo ""
read -p "Press any key to exit script..."
clear
