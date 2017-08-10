#! /bin/bash

read -p "input int number a b and c:" a b c
#find a b c max  value
#'-o' : or /  ||
#'-a' : and / &&
#if test $a -ge $b -a  $a -ge $c
if test $a -ge $b  && test  $a -ge $c
then
    echo "max value is a:$a"
elif [ $b -ge $a -a $b -ge $c ]
#elif [ $b -ge $a ] &&  [ $b -ge $c ]
then
    echo "max value is b:$b"
elif ((c>=a && c>=b))
then
    echo "max value is c:$c"
fi

