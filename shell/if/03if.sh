#! /bin/bash

read -p "input int a and b :" a b

#可是视为语句执行的开关
if test $a -gt $b
then
   echo "+++++++++++++++"
   echo "a>b"
   echo "+++++++++++++++"
else
   echo "+++++++++++++++"
   echo "a<=b"
   echo "+++++++++++++++"
   #嵌套
   if [ $a -eq $b ]
   then
       echo "<a==b>"
   else
       echo "[ a<b ]"
   fi
fi

echo "=====over======"
