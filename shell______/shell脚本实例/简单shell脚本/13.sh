#!/bin/bash

# 1）求1到100的和，平方值，奇数和，偶数和？

for  i in {1..100}
    do
       let  sum=sum+i
    done
echo $sum 

for  n  in {1..100}
    do
	pyz=0
	let  pyz=n*n
        echo $pyz
    done


for  m  in {1..100}
     do
	let x=m%2
         [ $x -eq 1 ] &&  let  sum2=sum2+m
      done
echo $sum2

for ((y=0;y<=100;y+=2))
#  或者　　for ((y=0;y<=100;y=y+2))
     do
         let sum3=sum3+y
     done
echo $sum3







