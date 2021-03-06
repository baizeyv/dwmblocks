#!/bin/sh

# case $BLOCK_BUTTON in
#     3) notify-send "ð ç½ç»æµéæ¨¡å" "\- æ¥çå®æ¶ç½ç»æµé
# - â¬: ä¸è¡æµé
# - â«: ä¸è¡æµé" ;;
#     6) st -e "$EDITOR" "$0" ;;
# esac


# update() {
#     sum=0
#     for arg; do
#         read -r i < "$arg"
#         sum=$(( sum + i ))
#     done
#     cache=${XDG_CACHE_HOME:-$HOME/.cache}/${1##*/}
#     [ -f "$cache" ] && read -r old < "$cache" || old=0
#     printf %d\\n "$sum" > "$cache"
#     printf %d\\n $(( sum - old ))
# }
#
# RX=$(update /sys/class/net/[ew]*/statistics/rx_bytes)
# TX=$(update /sys/class/net/[ew]*/statistics/tx_bytes)
#
# # æ¢ç®åä½
# if [[ $RX -lt 1024 ]];then
#     # å¦ææ¥æ¶éçå°äº1024,ååä½ä¸ºB/s
#     RX="${RX}B/s"
# elif [[ $RX -gt 1048576 ]];then
#     # å¦åå¦ææ¥æ¶éçå¤§äº 1048576,åæ¹ååä½ä¸ºMB/s
#     # RX=$(echo $RX | awk '{print $1/1048576 "MB/s"}')
#     RX=$(echo $(echo "scale=2; $RX/1048576" | bc)MB/s)
# else
#     # å¦åå¦ææ¥æ¶éçå¤§äº1024ä½å°äº1048576,ååä½ä¸ºKB/s
#     # RX=$(echo $RX | awk '{print $1/1024 "KB/s"}')
#     RX=$(echo $(echo "scale=2; $RX/1024" | bc)KB/s)
# fi
#
# # æ¢ç®åä½
# if [[ $TX -lt 1024 ]];then
#     # å¦æåééçå°äº1024,ååä½ä¸ºB/s
#     TX="${TX}B/s"
# elif [[ $TX -gt 1048576 ]];then
#     # å¦åå¦æåééçå¤§äº 1048576,åæ¹ååä½ä¸ºMB/s
#     # TX=$(echo $TX | awk '{print $1/1048576 "MB/s"}')
#     TX=$(echo $(echo "scale=2; $RX/1048576" | bc)MB/s)
# else
#     # å¦åå¦æåééçå¤§äº1024ä½å°äº1048576,ååä½ä¸ºKB/s
#     # TX=$(echo $TX | awk '{print $1/1024 "KB/s"}')
#     TX=$(echo $(echo "scale=2; $RX/1024" | bc)KB/s)
# fi
#
# printf "[â«:$TX â¬:$RX]"


update() {
    sum=0
    for arg; do
        read -r i < "$arg"
        sum=$(( sum + i ))
    done
    cache=${XDG_CACHE_HOME:-$HOME/.cache}/${1##*/}
    [ -f "$cache" ] && read -r old < "$cache" || old=0
    printf %d\\n "$sum" > "$cache"
    printf %d\\n $(( sum - old ))
}

rx=$(update /sys/class/net/[ew]*/statistics/rx_bytes)
tx=$(update /sys/class/net/[ew]*/statistics/tx_bytes)

printf "@[â¬:%4sB/s â«:%4sB/s]\\n" $(numfmt --to=iec $rx) $(numfmt --to=iec $tx)
