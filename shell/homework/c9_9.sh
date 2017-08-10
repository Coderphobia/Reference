#! /bin/bash
#
#3.打印一个99 乘法表
#

for i in `seq 9`
do
   for j in `seq $i`
   do
      echo -n "$j*$i=$[i*j] "
   done

   echo
done
