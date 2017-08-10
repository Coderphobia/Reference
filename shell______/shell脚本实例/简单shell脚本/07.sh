#!/bin/bash

read  -p "Please input  your username: "   u

if [ "$u" = "root" ] ;then
	echo "admin"
elif [ "$u" = "chuyue" ] ;then
	echo "normal"
else
	echo "user not  exist"
fi
