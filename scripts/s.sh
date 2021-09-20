#!/bin/sh
case $BUTTON in
	1) notify-send "222" "$(ps axch -o cmd,%cpu --sort=-%cpu | head)" ;;
	3) st -e htop ;;
esac

echo "^r0,7,2,4^^r2,4,22,10^^c#000000^^r3,5,20,8^^c#ffffff^^r10,5,13,8^^d^^f24^"
