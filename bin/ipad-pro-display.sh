#!/bin/bash
IPADDISPLAY=""
PRIMARYDISPLAY=""

if [ "`hostname`" = "purcell" ]; then
  IPADDISPLAY="HDMI1"
  PRIMARYDISPLAY="eDP1"
elif [ "`hostname`" = "beethoven" ]; then
  IPADDISPLAY="HDMI-A-0"
  PRIMARYDISPLAY="DisplayPort-0"
else
  echo "No configuration for this host"
  exit 1
fi
if [ -n "`xrandr | grep ipad_pro | grep '*'`" ]; then
  xrandr --output $IPADDISPLAY --off
else
  xrandr --output $IPADDISPLAY --mode ipad_pro --left-of $PRIMARYDISPLAY
fi
