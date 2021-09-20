#!/bin/sh
case $BUTTON in
	1) notify-send "CPU usage" "$(ps axch -o cmd,%cpu --sort=-%cpu | head)" ;;
	3) st -e htop ;;
esac

echo "[status2d] ^c#FF0000^red text with blue rectangle^c#55cdfc^^r3,3,14,14^^f20^^c#FFFFFF^^b#f7a8b8^ and white text on pink background ;"
