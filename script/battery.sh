#!/bin/sh

# Prints all batteries, their percentage remaining and an emoji corresponding
# to charge status (๐ for plugged up, ๐ for discharging on battery, etc.).

case $BLOCK_BUTTON in
	3) notify-send "๐ ็ตๆบๆจกๅ" "๐: ไฝฟ็จ็ตๆฑ ไธญ
๐: ๆชๆพๅฐ็ตๆฑ 
๐: ๅ็ตไธญ
๐: ๅทฒๅๆปก
โ: ็ต้ไฝไบ20%่ญฆๅ!" ;;
	#4) xbacklight -inc 10 ;;
	#5) xbacklight -dec 10 ;;
	6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

# Loop through all attached batteries.
for battery in /sys/class/power_supply/BAT?
do
	# Get its remaining capacity and charge status.
	capacity=$(cat "$battery"/capacity 2>/dev/null) || break
	status=$(sed "s/[Dd]ischarging/๐/;s/[Nn]ot charging/๐/;s/[Cc]harging/๐/;s/[Uu]nknown/โ/;s/[Ff]ull/๐ฎ/" "$battery"/status)

	# If it is discharging and 25% or less, we will add a โ as a warning.
	 [ "$capacity" -le  5 ] && [ "$status" = "๐" ] && status="โ" && poweroff
	 [ "$capacity" -le 25 ] && [ "$status" = "๐" ] && status="โ" && cvlc --play-and-exit ./low.power.mp3

	printf "[%s %s%%]" "$status" "$capacity"
done | sed 's/ *$//'
