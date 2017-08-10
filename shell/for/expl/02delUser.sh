#! /bin/bash
#
#删除系统小以test00开头的用户
#

for userName in $(grep  "^test00" /etc/passwd | cut -d ":" -f1)
do
   echo "del <$userName> ..."
   userdel  -r $userName
done
