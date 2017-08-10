#! /bin/bash
#2.检查某目录下是否有空文件 如果有删除并告之删除的总数
#./xxx.sh   path
#
#默认检查当前目录
path="./"

if ! test -z $1
then
   path=$1
fi
########################
if ! test -d  $path
then
   echo "sorry! <$path> not exists or is not a directory"
   exit 1
fi
##########check empty file
echo -e "\033[31m cur work path:$(pwd)\033[0m"
#change work path
cd $path
echo -e "\033[31m cur work path:$(pwd)\033[0m"

count=0

for fname in $(ls ./)
do
   #为普通文件 且 为空 
   if test -f $fname && ! test -s $fname
   then
   	#echo $fname
        echo "del empty file $fname"
        rm -rf $fname
        let "count++"
   fi
done

echo "总计:$count"

unset fname
unset count
exit  0

