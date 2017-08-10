#! /bin/bash
#
#1.判断某个文件是否存在，如果存在则判断是否为空文件 如果为空实现删除
#./xxx.sh  /var/ftp/pub/ttt.txt
#
#判断用户是否传参
if test $# -ne 1
then
   echo "use:[$0] [file]"
   exit 1
fi

fname=$1
#判断是否存在且是否为文件
if ! test -f $fname
then
   echo "$fname is not exist or is not regular file"
   exit 2
fi

#判断是否为空文件 如果是则删除
if  test -s $fname
then
   echo "$fname is regular file but is not empty"
else
   echo "$fname is empty file del...."
   rm -rf $fname
fi

exit 0
