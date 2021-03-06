#!/bin/sh

case $BLOCK_BUTTON in
	1) notify-send "ð¿ Memory hogs" "$(ps axch -o cmd:15,%mem --sort=-%mem | head)" ;;
	2) setsid -f st -e htop ;;
	3) notify-send "ð¿ åå­æ¨¡å" "\- æ¥çåå­ä½¿ç¨çåæ»é.
- å·¦é®ç¹å»æ¥çåå­å ç¨æåµ.
- ä¸­é®ç¹å»æå¼htop." ;;
	6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

# cmd=$(free --mebi | sed -n '2{p;q}' | awk '{printf ("[ð¿ %2.2fGiB/%2.2fGiB]\n", ( $3 / 1024), ($2 / 1024))}')
cmd=$(free -h | awk '/^Mem/ { print ("[ð¿ "$3"/"$2"]") }' | sed s/i//g)
printf "$cmd"
