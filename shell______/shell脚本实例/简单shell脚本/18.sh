#!/bin/bash
#批量添加N个用户，用户名不规则，来自于文件username.txt，密码呢为随机字符串(要记录用户名对应的密码);

x=0
y=0
userfile=/var/www/html/mr-huang/Shell_scripts/03_example/username.txt
userlog=/var/log/useradd.log

while   read  user
    do
# 在添加用户之前，考虑用户名在你的系统里面是不是已经存在了。
# 用grep去过滤/etc/passwd的文件。
      grep  "^\<$user\>"  /etc/passwd   &> /dev/null
      if  [ $? -eq  0 ] ;then
	 echo "$user  exist."
	 let x++
	 continue
      else
         useradd   "$user"
         #用mkpasswd -l 15 -d 3 -C 5 创建密码，　用户名和密码的对应关系要存储到一个日志文件保留。
         pass=$(mkpasswd  -l 10 -d 3 -C 3 -s 2)
	 echo "${user}:${pass}"|tee -a  $userlog |chpasswd 
	 let  y++
      fi
    done <$userfile
# 统计一下本次添加了几个用户到系统。有几个已经存在的没有添加。

echo  "$x  users exist.  $y  users  add."
echo  "username and password : "
cat  "$userlog"
