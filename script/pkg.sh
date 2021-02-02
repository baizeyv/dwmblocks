#!/bin/sh

# Displays number of upgradeable packages.
# For this to work, have a `pacman -Sy` command run in the background as a
# cronjob every so often as root. This script will then read those packages.
# When clicked, it will run an upgrade via pacman.
#
# Add the following text as a file in /usr/share/libalpm/hooks/statusbar.hook:
#
# [Trigger]
# Operation = Upgrade
# Type = Package
# Target = *
#
# [Action]
# Description = Updating statusbar...
# When = PostTransaction
# Exec = /usr/bin/pkill -RTMIN+8 dwmblocks # Or i3blocks if using i3.

case $BLOCK_BUTTON in
	# 1) setsid -f "$TERMINAL" -e popupgrade ;;
	1) sh /home/baizeyv/willGit/dwmblocks/script/check_pkg.sh ;;
	2) notify-send "$(/usr/bin/pacman -Qu)" ;;
	3) notify-send "🎁 更新模块" "📦: 可升级的软件包数量
- 左键点击升级软件包
- 中键点击查看可更新的软件包" ;;
	6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

c=$(pacman -Qu | grep -Fcv "[ignored]" | sed "s/^/📦 /;s/^📦 0$/📦 已是最新/g")
printf "$c"
