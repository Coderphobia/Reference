#! /bin/bash
#
#5.写一个脚本 xxx.sh   /xxx/zzz/file.conf  
#判断该文件是否以'.conf'为后缀 如果是将其复制到/tmp下 并将后缀改为'.html'
#
if [ $# -ne 1 ]
then
   echo "use:[$0][file]"
   exit 1
fi
#
fname=$1
#check fname is exist or is regular file
if ! test -f $fname
then
   echo "$fname not exist or not regular file !"
   exit 2
fi
#############取后缀
temp=${fname##*.}
if test $temp = "conf"
then
   #提取文件名
   name=${fname##*/}
   name=${name%.*}
   \cp  $fname  /tmp/${name}.html
fi
