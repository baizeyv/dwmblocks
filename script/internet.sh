#!/bin/sh

# Show wifi 📶 and percent strength or 📡 if none.
# Show 🌐 if connected to ethernet or ❎ if none.

case $BLOCK_BUTTON in
	# 1) "$TERMINAL" -e nmtui; pkill -RTMIN+4 dwmblocks ;;
	1) st -e nmtui; pkill -RTMIN+4 dwmblocks ;;
	3) notify-send "🌐 网络模块" "\- 左键点击连接网络
📡: 没有Wifi连接
📶: Wifi已连接
❎: 没有以太网连接
🌐: 以太网已连接
" ;;
	6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

GetIp(){
    local ipv4=$( ip addr | egrep -o '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | \
    egrep -v "^192\.168|^172\.1[6-9]\.|^172\.2[0-9]\.|^172\.3[0-2]\.|^10\.|^127\.|^255\.|^0\." | head -n 1 )
    [ -z "${ipv4}" ] && ipv4=$( wget -qO- -t1 -T2 ip.hws.com/getip.asp )
    if [ "${ipv4}" == "" ]; then
        ipv4='127.0.0.1'
    fi
    printf -- "%s" "${ipv4}"
}

case "$(cat /sys/class/net/w*/operstate 2>/dev/null)" in
	down) wifiicon="📡" ;;
	up) wifiicon="$(awk '/^\s*w/ { print "📶" }' /proc/net/wireless)" ;;
esac

printf "[Eth:%s,Wifi:%s]\n" \
    "$(sed "s/down/❎/;s/up/🌐/" /sys/class/net/e*/operstate 2>/dev/null)" \
    "$wifiicon"
    #"$(GetIp)"
