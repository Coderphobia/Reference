#!/bin/bash
# 要求：打印出以下图形
:<<EOF
    .
   . .
  . . .
 . . . .
. . . . .
 . . . .
  . . .
   . .
    .
EOF

# 参考代码：

MAX_NO=0

read -p  "Enter Number between (5 to 9) : "  MAX_NO

if ! [ $MAX_NO -ge 5 -a $MAX_NO -le 9 ] ; then
   echo "WTF... I ask to enter number between 5 and 9, Try Again"
   exit 1
fi

clear

for (( i=1; i<=MAX_NO; i++ ))
do
    for (( s=MAX_NO; s>i; s-- ))
    do
       echo -n " "
    done
    for (( j=1; j<=i;  j++ ))
    do
     echo -n " ." 
    done
    echo ""
done
###### Second stage ######################
let MAX_NO=MAX_NO-1
for (( i=MAX_NO; i>=1; i-- ))
do
    for (( s=i; s<=MAX_NO; s++ ))
    do
       echo -n " "
    done
    for (( j=1; j<=i;  j++ ))
    do
     echo -n " ."
    done
    echo ""
done


echo -e "\n\t\t\t ^_^ Whenever you need help, \e[1;34m www.365linux.com \e[0m is always there ^_^ \n"
