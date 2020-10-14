#!/bin/bash
IPADDISPLAY=""
PRIMARYDISPLAY=""

if [ "`hostname`" = "purcell" ]; then
  IPADDISPLAY="HDMI-1"
  PRIMARYDISPLAY="eDP-1"
elif [ "`hostname`" = "beethoven" ]; then
  IPADDISPLAY="HDMI-A-0"
  PRIMARYDISPLAY="DisplayPort-0"
else
  echo "No configuration for this host"
  exit 1
fi
if [ -n "`xrandr | grep ipad_pro | grep '*'`" ]; then
  xrandr --output $IPADDISPLAY --off
  xrandr --delmode $IPADDISPLAY ipad_pro
  xrandr --rmmode ipad_pro
#  $HOME/.config/polybar/launch.sh
else
  xrandr --newmode "ipad_pro"   115.50  1368 1448 1592 1816  1024 1027 1037 1063 #-hsync +vsync
  xrandr --addmode $IPADDISPLAY ipad_pro
  xrandr --output $IPADDISPLAY --mode ipad_pro --left-of $PRIMARYDISPLAY
#  $HOME/.config/polybar/launch.sh
fi
