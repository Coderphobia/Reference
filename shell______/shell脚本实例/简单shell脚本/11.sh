#!/bin/bash

# for 循环的例子
# 循环体是多个字符串

notuse (){
for  i  in  a  b  c  d  1 2 3  abc  889
     do 
	 echo  "$i"
     done


for  n  in  {1..10}
      do
	 echo $n
      done


for  ((i=1;i<=10;i++))
	do 
	   echo $i
	done

}


for i in 　$(cat /etc/passwd) 
     do
	echo "$i" 
	echo "-----------------我是分割线-----------------------"
     done
