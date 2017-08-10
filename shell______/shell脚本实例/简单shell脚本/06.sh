#!/bin/bash
# 检查系统的sshd服务看是否正在运行。如果没有运行，则启动。并记录其启动的时间到ssh.log。

#service   sshd  status
netstat -ntupl |grep sshd &> /dev/null
[ "$?"  -eq  0  ] &&  exit
service    sshd  restart
echo  "$(date)     sshd  restart..."  >> /tmp/sshd.log 
