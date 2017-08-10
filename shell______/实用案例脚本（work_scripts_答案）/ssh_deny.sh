#!/bin/bash
#Deny hosts 脚本定时分析系统的安全日志，抓取其中在指定的时间能连续访问失败次数超过规定阀值的IP，则添加到应用防火墙中自动屏蔽。
#该脚本的重点是训练你的脚本能力,如果防止暴力登录有更好的方法: iptables的规则 或者  fail2ban  ,  denyhosts应用程序.
#2012-09-10
#hdaojin

VERSION=1.0
SECURELOG=/var/log/secure
TMPFILE=/tmp/FIP.txt
LIMIT=10
DFILE=/etc/hosts.deny

awk '/Failed/{print $11}' $SECURELOG > $TMPFILE
cat $TMPFILE |sort -n |uniq -c|while read line
	do
		DIP=`echo "$line" |awk '$1>='"$LIMIT"'{print $2}'`
		grep -q "$DIP" "$DFILE" 
		if [ "$?" -ne 0 ];then
			echo "sshd:$DIP" >> $DFILE
		fi	
	done
