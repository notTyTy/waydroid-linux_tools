#!/usr/bin/env bash

# Waydroid Session Installer
# 
# This will install Mutter & Weston session managers, and setup the 
# Waydroid session options for them
# 

WD_FILE=/usr/share/wayland-sessions/waydroid.desktop
HPATH=$HOME
CONFIG="false"

echo "Checking for mutter & weston first. Sakura is also required as an additional dependency..."
sudo dnf install weston mutter sakura -y
echo "now installing..."
sudo chmod +x usr/bin
sudo cp -rp usr/* /usr/
cp -r home/ $HPATH/

read -p "Do you want to configure Waydroid-Session launch type (y/n)?" choice
case "$choice" in 
  y|Y ) echo "yes" && CONFIG="true";;
  n|N ) echo "no" && echo "OK. You're the boss";;
  * ) echo "invalid";;
esac

if [ "$CONFIG" == "true" ]; then
	sh /usr/bin/configure_launch_type.sh 
fi

echo "All set. Thanks for installing."
