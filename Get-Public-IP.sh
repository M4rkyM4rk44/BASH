#!/usr/bin/env bash

# Install curl if not installed
sudo apt update && sudo apt upgrade -y
sudo apt install curl -y
sleep 1

# Script
clear
echo "=====Get Public IP====="
echo ""
p=$(curl -s https://icanhazip.com)
echo "Public IP is: " $p
echo ""
read -p "Press any key to exit script..."
clear
