#! /bin/bash

#while :  等价 while(1)
#while true  等价 while(1)

#for  i in `seq 0 5`
#for((i=0;i<=5;i++))

#初始化部分
i=0
while [ $i -le 5 ]   #条件 也可用 test >> while test $i -le 5
do
   echo "i:$i"
   #调整
   let "i++"
   if [ $i -eq 3 ]
   then
      break
   fi
done


