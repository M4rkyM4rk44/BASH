#!/usr/bin/env bash

# This script was created to assist with a fresh Ubuntu 24.04 install.

# Applications to install.
APPLICATIONS=(
bleachbit
htop
clamtk
flameshot
gnome-clocks
gnome-games
gnome-logs
gtkhash
jq
libreoffice
meld
metadata-cleaner
minder
pv
secure-delete
smartmontools
speedtest-cli
stacer
tldr
tree
ttf-mscorefonts-installer
vlc
weather-util
whois
)

# Flatpaks to install.
FLATPAKS=(
com.github.qarmin.czkawka
com.github.tchx84.Flatseal
com.google.Chrome
com.sleepfiles.OSCAR
com.tradingview.tradingview
io.ente.auth
io.github.bytezz.IPLookup
io.github.giantpinkrobots.flatsweep
io.gitlab.theevilskeleton.Upscaler
org.gabmus.whatip
org.localsend.localsend_app
)

# Update & Install Nala
sudo apt update && sudo apt upgrade -y
sudo apt install nala -y
sleep 1

# Install Applications
sudo nala install -y ${APPLICATIONS[@]}
sleep 1

# Install Flatpaks
sudo apt install flatpak -y
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install -y ${FLATPAKS[@]}
