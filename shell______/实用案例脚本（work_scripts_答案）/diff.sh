#!/bin/bash

#写一个脚本跟踪网页源代码的变更，如果网页发生了改变，则发送邮件警告。(可以在本地监控一个文件夹的文件内容来模拟) (mtime 或者 md5 或者 diff)

ddir=/public
md5_file=/usr/share/doc/md5.txt

org(){
md5sum  "$ddir"/*  > $md5_file
}

[ -f  $md5_file ] || org 

for  i in  $(find  $ddir  -mindepth 1)
     do
	file_name=$( md5sum  "$i" |awk  '{print $2}' )
        grep  "$file_name"  $md5_file &> /dev/null
        if [ $? -eq  0 ];then
	      grep  "$(md5sum  $i)" $md5_file  &>/dev/null
	      if [  $? -ne 0 ] ;then
		echo "This file  $file_name CHANGED."
	      fi
        else
	   echo "This file  $file_name  ADD and UNKNOW."
        fi
    done
	


