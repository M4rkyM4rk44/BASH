#!/usr/bin/env bash

# Color Variables
Reset='\033[0m'
Red='\033[1;31m'
Green='\033[1;32m'

clear

# Stop NextDNS
sudo nextdns stop
read -p "$(echo -e "NextDNS has been ${Red}disabled${Reset}, to enable again press any key.")"
clear

# Start NextDNS
sudo nextdns start
read -p "$(echo -e "NextDNS has been ${Green}enabled${Reset}, press any key to exit script.")"
clear
exit
