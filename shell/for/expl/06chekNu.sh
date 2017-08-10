#! /bin/bash
#
#5.任意输入一个整数，判断是否包含数字'3'   输出yes or no
#

read -p "input a num:" num

len=${#num}

for i in  $(seq 0 $((len-1)))
do
   bit=${num:$i:1}    #求其 i 位
   if [ $bit -eq 3 ]
   then
      echo "yes."
      exit 0
   fi
done

echo "no."

