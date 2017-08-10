#!/bin/bash
# 删除指定目录内超过30天未被修改过的文件，但要排除某一些特定的文件（比如文件名是以.bak结尾）；

dir=/public

find  $dir   -mtime  +30 -print |while  read line
     do
	 echo $line |grep  -i '\.bak$' &> /dev/null
	 if [ $?  -ne 0 ];then
	    rm -rf  $line
	 fi
