#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

# Keyboard layout

xmodmap ~/.config/X11/Xmodmap

# Wallpaper
feh --bg-fill ~/Pictures/Wallpaper/oni.jpg

#start sxhkd to replace Qtile native key-bindings
run sxhkd -c ~/.config/qtile/sxhkd/sxhkdrc &

# Desktop applications

run nm-applet &
run volumeicon &
run pamac-tray &
run xfce4-power-manager &
numlockx on &
blueberry-tray &
cbatticon -i notification &
picom &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
/usr/lib/xfce4/notifyd/xfce4-notifyd &

# User applications

run firefox &
run thunderbird &
