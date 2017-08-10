#! /bin/bash

#函数的定义<定义必须在调用之前>
function sayHello()
{
   echo -e "\033[31m"
   echo "++++++++++"
   echo "+ hello! +"
   echo "++++++++++"
   echo -e "\033[0m"
}

#function 可以不加关键字
addTwoNum()
{
   echo "add func \$0:$0 \$1:$1 \$2:$2 \$# :$#"

   if [ $# -ne 2 ]
   then
      echo "调用add函数必须传两个数据"
      return -1   #return返回函数（函数调用结束）
   fi

   let "sum=$1+$2"
   return $sum
}

############################
clear
echo "======start======="

#函数的调用
sayHello
ls /
sayHello

ls /home

sayHello

#函数同样通过位置参数进行传参
#通过'$?'接收返回值 (返回值位无符号8bit位数据 0-255)
addTwoNum 10 20
echo -e "\033[32m10 add 20结果是:$?\033[0m"


addTwoNum 5 200
echo -e "\033[32m100 add 200结果是:$?\033[0m"

echo "====== end ======="
