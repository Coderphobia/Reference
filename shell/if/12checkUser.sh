#! /bin/bash
#
#6.任意输入一个用户名 判断该用户是否存在,如果存在打印出其的家目录路径
#
read -p "input username>" name
#stdout stderr info 重定向到 /dev/null
id $name &> /dev/null
if test $? -ne 0
then
   echo "<$name> user not exist !"
   exit  1
fi

grep "^$name:" /etc/passwd | cut -d ":"  -f6


###################
unset name
exit  0
