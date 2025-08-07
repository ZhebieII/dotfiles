#!/bin/bash

# Check if we're running under Wayland or X11
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    # Wayland version using hyprctl
    connected_monitors=$(hyprctl monitors | grep "Monitor" | awk '{print $2}')

    # Check if only eDP-1 is connected
    if echo "$connected_monitors" | grep -q "^eDP-1$" && [ "$(echo "$connected_monitors" | wc -l)" -eq 1 ]; then
        # Only built-in screen eDP-1
        hyprctl keyword monitor "eDP-1,preferred,auto,1"
    else
        # Find first non-eDP-1 monitor
        external_monitor=$(echo "$connected_monitors" | grep -v "^eDP-1$" | head -n 1)

        if [ -n "$external_monitor" ]; then
            # Disable eDP-1 and enable external monitor
            hyprctl keyword monitor "eDP-1,disable"
            # Uncomment the line below if you want to set scale to 1.5
            # hyprctl keyword monitor "$external_monitor,preferred,auto,1.5"
        fi
    fi
else
    # X11 version using xrandr
    xrandr --output HDMI-A-0 --auto --primary --output eDP --off
fi

