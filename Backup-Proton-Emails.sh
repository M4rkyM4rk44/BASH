#!/usr/bin/env bash

# Variables
DATE=$(date +%Y"-"%m"-"%d) # Todays Date
A="/home/$USER/proton-mail-export-cli" # Proton Mail Export Tool Location
O="backup" # Export Tool Option to Use
D="/home/$USER/" # Backup Location
U="user@proton.me" # Put Your Protonmail Username Here

# Create backup
$A --operation $O --dir $D --user $U --telemetry
tar -cJvf "Proton-Mail-Backup_"$DATE.tar.xz -C ./ $U
md5sum "Proton-Mail-Backup_"$DATE.tar.xz > "Proton-Mail-Backup_"$DATE.tar.xz.md5
rm -fr $U
echo ""
read -p "Emails exported, archived, and MD5 checksum generated..."
echo ""
clear
exit
