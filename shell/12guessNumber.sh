#! /bin/bash
#
#、产生一个0--999随机数，让用户猜，同时电脑也猜直到猜对时退出  次数较少者盈
#

seedNum=$(expr $RANDOM % 1000 )

echo "num:$seedNum"

mCount=0
pCount=0
#电脑猜(二分查找法)
max=1000
min=0

while :
do
   let "mid=(max+min)/2"   #找出最小与最大的中间值
   let "mCount++"  #次数加 1

   if [ $mid -gt $seedNum ]
   then
      max=$mid
   elif [ $mid -lt $seedNum ]
   then
      min=$mid
   else
       break  #猜对了
   fi
done

#玩家猜
read -p "guess a num(0--999)>>" num
while true
do
   let "pCount++"

   if [ $pCount -gt $mCount ]
   then
      echo -e "\033[31mSorry!GAME OVER\033[0m"
      echo -e "\033[31mseed num:$seedNum\033[0m"
      break
   fi

   if [ $num -gt $seedNum ]
   then
       echo -e "\033[36msorry,too big\033[0m"
   elif [ $num -lt $seedNum ]
   then
       echo -e "\033[36msorry,too less\033[0m"
   else
       echo -e "\033[32myou win!!!!!!!!\033[0m"
       break
   fi

   read -p "guess a num(0--999) again>>" num
done


exit 0








