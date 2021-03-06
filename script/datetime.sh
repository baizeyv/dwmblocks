#!/bin/sh

clock=$(date '+%I')

case "$clock" in
	"00") clock_icon="ð" ;;
	"01") clock_icon="ð" ;;
	"02") clock_icon="ð" ;;
	"03") clock_icon="ð" ;;
	"04") clock_icon="ð" ;;
	"05") clock_icon="ð" ;;
	"06") clock_icon="ð" ;;
	"07") clock_icon="ð" ;;
	"08") clock_icon="ð" ;;
	"09") clock_icon="ð" ;;
	"10") clock_icon="ð" ;;
	"11") clock_icon="ð" ;;
	"12") clock_icon="ð" ;;
esac

case $BLOCK_BUTTON in
	1) notify-send "æä»½ä¿¡æ¯" "$(cal --color=always | sed "s/..7m/<b><span color=\"red\">/;s/..27m/<\/span><\/b>/")" && notify-send "Appointments" "$(calcurse -D ~/.config/calcurse -d3)" ;;
	2) setsid -f "$TERMINAL" -e calcurse ;;
	3) notify-send "ð æ¥ææ¨¡å" "\- æ¥çæä»½ä¿¡æ¯
- å·¦é®ç¹å»æ¾ç¤ºæ¥ååæªæ¥ä¸å¤©çè®¡å
- ä¸­é®ç¹å»æå¼calcurse(å¦æå·²å®è£)" ;;
	6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

LOCALTIME=$(date +"%Yå¹´%mæ%dæ¥ %a ${clock_icon} %H:%M:%S")

printf "${LOCALTIME}"
