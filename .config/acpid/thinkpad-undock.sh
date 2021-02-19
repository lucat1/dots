#!/bin/sh
#
# /etc/acpi/thinkpad-undock.sh

. /etc/acpi/thinkpad-config.sh

# enable the lid action when undocked
echo $lid > /sys/bus/acpi/drivers/button/bind
sleep $sleep

# properly setup XAUTHORTY to make xrandr to work
export XAUTHORITY="$xauthority"
em_test=$(sudo -u $xowner xrandr -d $xserver | grep $int_mon | grep " connected")
logger "thinkpad-undock: em_test: $em_test"

if [ -n "$em_test" ]; then
  sudo -u $xowner xrandr -d $xserver --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP1 --off --output DP2 --off --output DP2-1 --off --output DP2-2 --off --output DP2-3 --off --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off
fi
