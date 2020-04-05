#!/bin/bash
IPADDISPLAY=""

if [ "`hostname`" = "purcell" ]; then
  IPADDISPLAY="HDMI1"
elif [ "`hostname`" = "beethoven" ]; then
  IPADDISPLAY="HDMI-A-0"
fi
xrandr --output $IPADDISPLAY --off
