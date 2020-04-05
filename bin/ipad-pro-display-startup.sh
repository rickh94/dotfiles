#!/bin/bash
IPADDISPLAY=""

if [ "`hostname`" = "purcell" ]; then
  IPADDISPLAY="HDMI1"
elif [ "`hostname`" = "beethoven" ]; then
  IPADDISPLAY="HDMI-A-0"
  xrandr --output DisplayPort-0 --set TearFree on --mode 3440x1440
fi
xrandr --output $IPADDISPLAY --off
