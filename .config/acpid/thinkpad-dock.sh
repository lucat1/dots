#!/bin/sh
#
# /etc/acpi/thinkpad-dock.sh

. /etc/acpi/thinkpad-config.sh

# disable the lid action when docked
echo $lid > /sys/bus/acpi/drivers/button/unbind
sleep $sleep

# properly setup XAUTHORTY to make xrandr to work
export XAUTHORITY="$xauthority"
em_test=$(sudo -u $xowner xrandr -d $xserver | grep $ext_mon_1 | grep " connected")
logger "thinkad-dock: em_test: $em_test"

if [ -n "$em_test" ]; then
  # two-step because Intel HD can handle only two heads
  # sudo DISPLAY=:1 -u $xowner xrandr --output $ext_mon_1 --auto --primary --output $int_mon --off
  # sudo DISPLAY=:1 -u $xowner xrandr --output $ext_mon_2 --auto --right-of $ext_mon_1
  #sudo -u $xowner xrandr -d $xserver --output $ext_mon_1 --auto --primary
  #sudo -u $xowner xrandr -d $xserver --output $int_mon --off
  sudo -u $xowner xrandr -d $xserver --output eDP1 --off --output DP1 --off --output DP2 --off --output DP2-1 --primary --mode 3440x1440 --pos 0x0 --rotate normal --output DP2-2 --off --output DP2-3 --off --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off
fi
