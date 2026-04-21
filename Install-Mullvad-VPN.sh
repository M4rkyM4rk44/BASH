#!/usr/bin/env bash

# This script is for Installing and UnInstalling Mullvad VPN on Linux Mint 22.

while true
do
  # Menu
  clear
	echo "Select an option:"
	echo ""
	echo "0) Exit Script"
	echo "1) Install Mullvad VPN"
	echo "2) UnInstall Mullvad VPN"
	echo ""
	read -p "Option: " n
  case $n in
		0)
      # Exit Script
			clear
			exit
			;;
		1) 
      # Install Mullvad VPN
			clear
			sudo apt install curl -y
      sudo sudo curl -fsSLo /usr/share/keyrings/mullvad-keyring.asc https://repository.mullvad.net/deb/mullvad-keyring.asc
      echo "deb [signed-by=/usr/share/keyrings/mullvad-keyring.asc arch=$( dpkg --print-architecture )] https://repository.mullvad.net/deb/stable noble main" | sudo tee /etc/apt/sources.list.d/mullvad.list
      sudo apt update
      sudo apt install mullvad-vpn
			echo ""
			echo "-----Mullvad VPN Installed-----"
			echo ""
			read -p "Press any key to close terminal ..."
			break
			;;
		2) 
      # UnInstall Mullvad VPN
			clear
			sudo apt purge mullvad-vpn -y
			echo ""
			echo "-----Mullvad VPN UnInstalled-----"
			echo ""
			read -p "Press any key to close terminal ..."
			break
			;;
		*) 
      # Other / Invalid Option
			clear
			echo ""
			echo "Invalid Option!!"
			echo ""
			read -p "Press any key to return to menu ..."
			;;
	esac
done
clear
