#!/usr/bin/env bash

# This script allows the user to reset their CasaOS username and password.

sudo rm /var/lib/casaos/db/user.db
sudo reboot
