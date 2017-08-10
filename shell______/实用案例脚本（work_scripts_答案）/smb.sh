#!/bin/bash

# 批量添加samba用户的脚本

shell_dir=/var/www/html/mr-huang/Shell_scripts/08_exmple
users_file=${shell_dir}/username.txt
file_system="/"

while  read  line
	do
          username=$(echo $line |awk '{print $3}')
	  password=$(echo $line |awk '{print $4}')	
          useradd  -M  -s /sbin/nologin  $username   && echo "Add system user : $username \!"
	  echo -e "${password}\n${password}" | smbpasswd -a -s  $username  && echo "Add samba user : $username , passord : $password \!"
          #setquota  -u $username   10000   20000  0 0 $filesystem
	done  <$users_file


#  统计用户是否存在的代码参考 "03_example/18.sh"
