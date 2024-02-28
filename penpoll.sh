#!/bin/bash
# The purpose of this script is to poll xinput to map pen, eraser and touch
# devices to the laptop screen. This fixes the bug of having these inputs map
# across monitors, which distorts everything and makes it unusable.

pendone=false
eraserdone=false
screendone=false

while [ "$pendone" = false ]    || 
      [ "$eraserdone" = false ] || 
      [ "$screendone" = false ]
do

    if [ "$pendone" = false ] && 
       [ -n "$(xinput list | grep 'CUST0000:00 27C6:0111 Stylus Pen (0)')" ];
    then
        pendone=true
        xinput map-to-output "CUST0000:00 27C6:0111 Stylus Pen (0)" eDP-1
    fi

    if [ "$eraserdone" = false ] && 
       [ -n "$(xinput list | grep 'CUST0000:00 27C6:0111 Stylus Eraser (0)')" ];
    then
        eraserdone=true
        xinput map-to-output "CUST0000:00 27C6:0111 Stylus Eraser (0)" eDP-1
    fi

    if [ "$screendone" = false ] && 
       [ -n "$(xinput list | grep 'CUST0000:00 27C6:0111 ')" ];
    then
        screendone=true
        xinput map-to-output "CUST0000:00 27C6:0111" eDP-1
    fi

    sleep 0.1

done
