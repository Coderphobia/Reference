#!/bin/bash

# while 的循环体从文件读取

cat  /etc/issue  | while  read  line
           do
		 echo "$line"
	         echo "--------------------"
	   done 


# 第二种写法：

while  read  line2
	do
		 echo "$line2"
	         echo "--------------------"
	done  < /etc/issue
