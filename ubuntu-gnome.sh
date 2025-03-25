#!/usr/bin/env bash

if [ "$(id -u)" -ne 0 ]; then
  echo Please run this script as root or using sudo!
  exit
fi

apt-get update
apt-get remove -y --purge ubuntu-session gnome-shell-extension-* *yaru* plymouth-theme-*
apt-get autoremove -y
apt-get install -y gnome-session gnome-backgrounds gnome-tweaks chrome-gnome-shell plymouth-theme-ubuntu-gnome-logo adwaita-* gnome-themes-extra gnome-shell-extension-appindicator gnome-shell-extension-ubuntu-tiling-assistant  -y

# update default cursors and login screen
update-alternatives --set x-cursor-theme /usr/share/icons/Adwaita/cursor.theme
update-alternatives --set gdm-theme.gresource /usr/share/gnome-shell/gnome-shell-theme.gresource

# remove ubuntu logo from login screen
mv /usr/share/plymouth/ubuntu-logo.png /usr/share/plymouth/ubuntu-logo.png.backup

# optional - to make QT applications look good in dark mode
echo QT_STYLE_OVERRIDE=Adwaita-Dark >> /etc/environment

# in gnome tweaks change legacy theme to adwaita dark
# GDM login theme cannot be changed

# machinectl shell gdm@ $(which gsettings) set org.gnome.desktop.interface accent-color "red"
