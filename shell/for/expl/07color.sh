#! /bin/bash
#
#6.用终端颜色实现一个8*8国际象棋棋盘
#
clear

for i in $(seq 8)
do

    for j in `seq 8`
    do
      if [ $(((j+i)%2)) -eq 0 ]
      then
         echo -en "\033[40m  \033[0m" 
      else
         echo -en "\033[47m  \033[0m" 
      fi
    done

      echo  #回行

done
