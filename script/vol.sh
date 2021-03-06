#!/bin/sh

# Prints the current volume or ๐ if muted.

case $BLOCK_BUTTON in
	1) setsid -f "$TERMINAL" -e pulsemixer ;;
	2) amixer set Master toggle ;;
    4) amixer -qM set Master 2%+ umute ;;
    5) amixer -qM set Master 2%- umute ;;
	3) notify-send "๐ข ้ณ้ๆจกๅ" "\- ้ณ้่ฐ่:๐,๐,๐,๐
- ๅทฆ้ฎ็นๅปๆๅผpulsemixer
- ไธญ้ฎ็นๅป้้ณ.
- ๆป่ฝฎไธไธ่ฐๆด้ณ้." ;;
	6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

vol=$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')
mutestatus=$(amixer get Master | tail -n1 | cut -d'[' -f3 | cut -d']' -f1)

CURRENT=$(pacmd list-cards | grep "active profile" | cut -d ' ' -f 3-)
if [[ "$CURRENT" = "<output:hdmi-stereo+input:analog-stereo>" ]]; then
    card="HDMI"
else
    card="ANALOG"
fi

if [ "$mutestatus" == "on" ]; then
    if [ "$vol" -eq "0" ]; then
        icon="๐"
    elif [ "$vol" -gt "70" ]; then
        icon="๐"
    elif [ "$vol" -lt "30" ]; then
        icon="๐"
    else
        icon="๐"
    fi
    printf "[$icon $vol%% $card]"
elif [ "$mutestatus" == "off" ]; then
    icon="๐"
    printf "[$icon Mute $card]"
fi

