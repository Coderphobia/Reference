#! /bin/bash
#
#3.实现功能:输入一个用户名 判断是其用户类型:(uid 0 管理者用户 0<uid<999 程序用户 uid>=1000普通)
#uid -u username  获取uid
#
clear
read -p "input a username:" name

uid=$(id -u $name 2> /dev/null)
#check name is exist ?
if [ $? -ne 0 ]
then
   echo "$name not exist!"
   exit 1
fi
#check type
if test $uid -eq 0
then
   echo "管理者用户"
elif test $uid -gt 0 -a $uid -lt 1000
then
   echo "程序用户"
else
   echo "普通用户"
fi

#############################
unset uid
unset name
exit  0
