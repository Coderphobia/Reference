#! /bin/bash
#
#4.打印8*8的矩形 并实现其四边为红色\033[31m 对角线为绿色\033[32m
#
for i in  $(seq 8)
do
   for j in $(seq 8)
   do
      #四边
      if [ $i -eq 1 -o  $i -eq 8  -o $j -eq 1 -o $j -eq 8 ]
      then
          echo -en "\033[31m* \033[0m"
      elif [ $i -eq $j -o $((8-i+1)) -eq $j ]  #对角线
      then
          echo -en "\033[32m* \033[0m"
      else
          echo -n "  "
      fi
     
   done

   echo
done
