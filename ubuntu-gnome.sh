#!/bin/bash

sudo apt-get update
sudo apt-get remove -y --purge ubuntu-session gnome-shell-extension-*
sudo apt-get autoremove -y
sudo apt-get install -y gnome-session gnome-backgrounds gnome-tweaks chrome-gnome-shell plymouth-theme-ubuntu-gnome-logo adwaita-qt -y

sudo update-alternatives --config gdm3-theme.gresource

# update /usr/share/xsessions/gnome.desktop to have
# Exec=/usr/bin/gnome-session --session=gnome

# optional - to remove ubuntu logo
# sudo mv /usr/share/plymouth/ubuntu-logo.png /usr/share/plymouth/ubuntu-logo.png.backup

# optional - to make QT aplications look good in dark mode
# sudo echo QT_STYLE_OVERRIDE=Adwaita-Dark >> /etc/environment

