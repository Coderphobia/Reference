#! /bin/bash

function  checkNum()
{
   if [ $# -ne 2 ]
   then
      echo "checknum [数据] [数字]"
      return 11
   fi

   num=$1
   n=$2
   len=${#num}
   for i in $(seq 0 $((len-1)))
   do
       temp=${num:$i:1}
       if [ $temp -eq $n ]
       then
           return 0
       fi
   done

   return 1
}

##############################################

checkNum  123456  3
if [ $? -eq 0 ]
then
   echo "123456 include 3"
else
   echo "123456 not include 3"
fi


checkNum  123456  9
if [ $? -eq 0 ]
then
   echo "123456 include 9"
else
   echo "123456 not include 9"
fi


