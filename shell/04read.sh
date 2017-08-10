#! /bin/bash

read -p "input int a and b:" a  b

#echo "$a+$b=$(expr $a + $b)"
echo "$a+$b=$[a+b]"
