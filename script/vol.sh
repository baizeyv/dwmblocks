#!/bin/sh

# Prints the current volume or 🔇 if muted.

case $BLOCK_BUTTON in
	1) setsid -f "$TERMINAL" -e pulsemixer ;;
	2) pamixer -t ;;
	4) pamixer --allow-boost -i 1 ;;
	5) pamixer --allow-boost -d 1 ;;
	3) notify-send "📢 音量模块" "\- 音量调节:🔇,🔈,🔉,🔊
- 左键点击打开pulsemixer
- 中键点击静音.
- 滑轮上下调整音量." ;;
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
        icon="🔇"
    elif [ "$vol" -gt "70" ]; then
        icon="🔊"
    elif [ "$vol" -lt "30" ]; then
        icon="🔈"
    else
        icon="🔉"
    fi
    printf "[$icon $vol%% $card]"
elif [ "$mutestatus" == "off" ]; then
    icon="🔇"
    printf "[$icon Mute $card]"
fi

