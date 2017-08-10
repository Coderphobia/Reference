#!/bin/bash
# 写个脚本，监控sshd日志，如果某个客户端IP在30s内连续访问失败次数超过5次，那么就拒绝该IP的连接。过了30s后要解除限制

while true
do
  lastb |awk '{print $3}'|sort |uniq -c|sort -nr|while read i
    do
        c=$(echo "$i" |awk  '{print $1}') 
        ip=$(echo "$i" |awk  '{print $2}')
        if [ "$c" -ge 5 ];then
 	     iptables  -I INPUT -s "$ip" -p tcp --dport 22   -j DROP
        fi
   done
sleep  30
done
