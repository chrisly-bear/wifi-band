#!/bin/bash
# encoding: utf-8

# <bitbar.title>WiFi Band</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Christoph Schwizer</bitbar.author>
# <bitbar.author.github>chrisly-bear</bitbar.author.github>
# <bitbar.desc>Shows the band (5 GHz or 2.4 GHz) of the WiFi your Mac is connected to</bitbar.desc>

# https://en.wikipedia.org/wiki/List_of_WLAN_channels

channel=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/channel/ {print $2}' | cut -d',' -f1)
if [[ ("$channel" -ge 1) && ("$channel" -le 14) ]]; then
  echo "2.4G"
elif [[ ("$channel" -ge 32) && ("$channel" -le 196) ]]; then
  echo "5G"
else
  echo "N/A"
fi

