#!/bin/sh
notify-send -a DWM_PKG "📦 提示" "正在检查可更新软件包..."

# echo 'fahaxiki' | sudo -S pacman -Syyuw --noconfirm || notify-send -a DWM_PKG "错误,下载更新失败.
# 检查你的网络连接, 或手动更新."

yay -Syyu || notify-send -a DWM_PKG "错误,下载更新失败.检查你的网络连接, 或手动更新."
pkill -RTMIN+8 "${STATUSBAR:-dwmblocks}"

if echo 'fahaxiki' | sudo -S pacman -Qu | grep -v "\[ignored\]"
then
    notify-send -a DWM_PKG "🎁 提示" "有可用更新. 点击状态栏图标 (📦) 开始更新."
else
    notify-send -a DWM_PKG "📦 提示"  "同步完毕. 没有可更新的软件包."
fi

