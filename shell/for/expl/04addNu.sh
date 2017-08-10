#! /bin/bash
#
#3.计算 100以内 之和 sum  (要求用seq序列实现)
#

sum=0
for num in `seq 100`
do
   let "sum=sum+num"
done

echo "总和:$sum"


