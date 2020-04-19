#!/bin/bash
pactl load-module module-null-sink sink_name=sink1
sleep 1
pactl load-module module-loopback sink=sink1
sleep 1
pactl load-module module-loopback sink=sink1
sleep 1

# then
# set VLC media plyaer audo stream output to first null output
# set first loopback to Loopback of Blue Snowball Mono on first null output
# set second loopback to loopback to family 17h... from monitor of null output
