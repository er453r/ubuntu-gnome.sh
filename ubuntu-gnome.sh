#!/usr/bin/env bash

if [ "$(id -u)" -ne 0 ]; then
  echo Please run this script as root or using sudo!
  exit
fi

apt-get update
apt-get remove -y --purge ubuntu-session gnome-shell-extension-*
apt-get autoremove -y
apt-get install -y gnome-session gnome-backgrounds gnome-tweaks chrome-gnome-shell plymouth-theme-ubuntu-gnome-logo adwaita-qt -y

update-alternatives --config gdm3-theme.gresource

# remove ubuntu logo from login screen
mv /usr/share/plymouth/ubuntu-logo.png /usr/share/plymouth/ubuntu-logo.png.backup

# optional - to make QT applications look good in dark mode
echo QT_STYLE_OVERRIDE=Adwaita-Dark >> /etc/environment
