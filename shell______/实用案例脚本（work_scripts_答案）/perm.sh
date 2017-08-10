#!/bin/bash
# 自动对指定目录下的文件增加执行权限。
export dir=/var/www/html/mr-huang/Shell_scripts/08_exmple
while :
 do
   sh="$(find "$dir" -type f  -iname "*.sh" ! -perm -a+x -print)"
   if [ ! -z "$sh" ];then
        echo "$sh"|while read i
          do
                 chmod +x "$i"
          done
   fi
   sleep 2
done
