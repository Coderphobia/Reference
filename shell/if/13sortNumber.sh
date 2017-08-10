#! /bin/bash
#
#7.任意输入3个整数 然后将其按照特定的顺序(从大到小 或 从小到大)输出
#

read -p "input int a b and c:"  a b c

##############确保法a>=b>=c############
if [ $a -lt $b ]  #swap   a>=b
then
    temp=$a
    a=$b
    b=$temp
fi
###a>=c
if [ $a -lt $c ]
then
   temp=$a
   a=$c
   c=$temp
fi
####b>=c
if [ $b -lt $c ]
then
   temp=$b
   b=$c
   c=$temp
fi


echo "$a $b $c"
##############假设法##################
#if a is max
#if [ $a -ge $b -a $a -ge $c ]
#then
#   if test $b -ge $c
#   then
#      echo "$a $b $c"
#   else
#      echo "$a $c $b"
#   fi
#elif [ $b -ge $a -a $b -ge $c ]
#then
#   if ((a>=c))
#   then
#      echo "$b $a $c"
#   else
#      echo "$b $c $a"
#   fi
#elif test $c -ge $a -a $c -ge $b
#then
#   if [ $a -ge $b ]
#   then
#      echo "$c $a $b"
#   else
#      echo "$c $b $a"
#   fi
#fi
