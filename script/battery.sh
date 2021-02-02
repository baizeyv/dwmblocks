#!/bin/sh

# Prints all batteries, their percentage remaining and an emoji corresponding
# to charge status (🔌 for plugged up, 🔋 for discharging on battery, etc.).

case $BLOCK_BUTTON in
	3) notify-send "🔋 电源模块" "🔋: 使用电池中
🛑: 未找到电池
🔌: 充电中
😀: 已充满
❗: 电量低于20%警告!" ;;
	#4) xbacklight -inc 10 ;;
	#5) xbacklight -dec 10 ;;
	6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

# Loop through all attached batteries.
for battery in /sys/class/power_supply/BAT?
do
	# Get its remaining capacity and charge status.
	capacity=$(cat "$battery"/capacity 2>/dev/null) || break
	status=$(sed "s/[Dd]ischarging/🔋/;s/[Nn]ot charging/🛑/;s/[Cc]harging/🔌/;s/[Uu]nknown/❓/;s/[Ff]ull/🎮/" "$battery"/status)

	# If it is discharging and 25% or less, we will add a ❗ as a warning.
	 [ "$capacity" -le  5 ] && [ "$status" = "🔋" ] && status="❗" && poweroff
	 [ "$capacity" -le 25 ] && [ "$status" = "🔋" ] && status="❗" && cvlc --play-and-exit ./low.power.mp3

	printf "[%s %s%%]" "$status" "$capacity"
done | sed 's/ *$//'
