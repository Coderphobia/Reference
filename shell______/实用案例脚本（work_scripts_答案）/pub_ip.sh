#!/bin/bash
# Get the wlan IP on gateway.
#
#
# usage  */10 * * * *  root  /shells/pub_ip.sh

shell_dir=/var/shells
ip_file=$shell_dir/ip.txt
#mail="8325643@163.com"
mail="root"
server="gdlc-teacher"
test_web="http://ip.chinaz.com"
sign_content="您来自"
# 把root@yourhostname加入到163邮箱的白名单。

[ -d "$shell_dir" ] || mkdir -p  "$shell_dir"
[ ! -f  "$ip_file" ] && touch  "$ip_file"

wlan_ip=$(curl -4 -f  -m 30 -s "$test_web" 2>/dev/null|grep "$sign_content"|egrep -o  '\<([0-9]{1,3}\.){3}[0-9]{1,3}\>' 2>/dev/null)

# lynx -source  "$test_web"
# w3m -dump "$test_web"

grep -q  "$wlan_ip"  "$ip_file"
if [ "$?" -ne 0 -a -n "$wlan_ip" ];then
    echo "$wlan_ip"|tee "$ip_file"|mail -s "New wlan ip for $server"  "$mail"
fi

# 有个更简单的方法,用"curl  ifconfig.me"的命令直接获取.
