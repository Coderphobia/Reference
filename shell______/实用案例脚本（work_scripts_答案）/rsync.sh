#!/bin/bash
# 使用rsync命令进行远程目录和本地目录的差量同步。
# usage ./rsync.sh   [/destdir]
# v0.2
s_ip="192.168.4.130"
s_dir="backup"
d_dir="$HOME/backup"
#log_file="/var/log/rsync_note.log"

rsn () {
#       rsync -azH --delete "$s_ip"::"$s_dir"  "$d_dir"  2>"$log_file" 1>/dev/null
        rsync -azH --delete "$s_ip"::"$s_dir"  "$d_dir"
}

#if [ $(id -u) -ne 0 ];then
#        echo "Must root"
#        exit 99
#fi

[ -n "$1"  ] && d_dir="$1"

[ ! -d "$d_dir" ] && mkdir "$d_dir"

sgin=$(ls "$d_dir"|head -1)
if [ -n "$sgin" ] ;then
        read -p "$d_dir is not empty, continue? [y/n]"  yn
        case "$yn" in
                [Yy][Ee][Ss]|[Yy])
                        rsn
                        ;;
                [Nn][Oo]|[Nn])
                        exit 0
                        ;;
                        *)
                        echo "sorry"
                        ;;
                esac
        else
                rsn
fi
