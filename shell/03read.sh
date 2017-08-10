#! /bin/bash

# '-n' 输出完毕后不回行
echo -n "input a int num:"
read number
echo "number:$number"

#p:print
echo "--------------------------"
read -p "input you name:" name
echo "name:<$name>"

# must 6 count char
echo "--------------------------"
read -p "input you pas(length must less 6)>"  -n 6 pas
echo "you pas is:$pas"

#timeout
echo "--------------------------"
read -p "input in 5 second>" -t 5 temp
echo "temp>$temp"

#password mode
echo "--------------------------"
read -p "passwd:" -s  pas
echo
echo "passwd is:$pas"

