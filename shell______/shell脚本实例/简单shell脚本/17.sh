#!/bin/bash

echo "用*号打印出一个三角形:"

#  *
#  **
#  ***
#  ****
#  *****


for  i in {1..5}
     do
	for ((j=1;j<=i;j++))
	  do
	    echo -n "*"
	  done
	echo
     done


echo "  99乘法表"

for  i in {1..9}
     do
	for ((j=1;j<=i;j++))
	   do
	      echo -en "$j"\*"$i"=$(($j*$i))"\t"
	   done
	echo
     done

Notuse1(){
cat <<EOF
*****
****
***
**
*
EOF
}

echo " 倒三角形"
for  i in {1..5}
     do
	for ((j=5;j>=i;j--))
	  do
	    echo -n "*"
	  done
	echo
     done




NotUse2(){
    *
   **
  ***
 ****
*****
}

echo "反直角三角形"

for  ((i=1;i<=5;i++))
     do
        for ((j=5;j>i;j--))
	   do
		echo -n " "
	   done
	for ((n=1;n<=i;n++))
	   do
	        echo -n "*"
	   done
     echo
     done

echo "反直角三角形2"


for  ((i=5;i>=1;i--))
    do
        for ((n=5;n>i;n--))
           do
              echo  -n " "
           done
        for ((j=1;j<=i;j++))
           do
             echo  -n "*"
           done
        echo 
    done




echo  "等腰三角形"

NotUse3(){
    *
   * *
 * * * *
* * * * *
}

for  ((i=1;i<=5;i++))
     do
        for ((j=5;j>i;j--))
           do
                echo -n " "
           done
        for ((n=1;n<=i;n++))
           do
                echo -n " *"
           done
     echo
     done


NotUse4(){
    *
   * *
 * * * *
* * * * *
 * * * *
  * * *
   * *
    *
}

echo "菱形"



