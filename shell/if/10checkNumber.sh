#! /bin/bash
#
#4.任意输入一个整数判断其为奇数还是偶数
#
read -p "input a int number:" num

if [ $((num%2)) -eq 0 ]
then
   echo "$num 为偶数"
else
   echo "$num 为奇数"
fi

unset num
exit  0
