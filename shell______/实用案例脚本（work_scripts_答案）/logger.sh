#!/bin/bash
# 该脚本模拟应用程序通过rsyslog记录系统日志.用于测试日志切割的脚本.

logfile=/var/log/test.log
[ -f $logfile ] || touch  $logfile

# 指定log发送到/var/log/test.log, 需要配置系统
# vim /etc/rsyslog.conf
# user.notice    /var/log/test.log
# 重启服务

while  true
      do
	 logger  "test   logrotate"
         sleep 1
      done


