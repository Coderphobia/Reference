#! /bin/bash
#
#1.产生一个1000以内随机数  将该数的每个数字位拆分求和
#如:123   >>>sum=1+2+3
#
num=$(expr $RANDOM  % 1000)
sum=0
len=${#num}

for  i in  $(seq 0  $((len-1)))
do
    #echo ${num:$i:1}
    temp=${num:$i:1}
    let "sum=sum+temp"
done

echo "$num 每个数字位之和:$sum"

unset num
unset temp
unset sum
exit  0

