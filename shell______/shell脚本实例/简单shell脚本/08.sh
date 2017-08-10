#!/bin/bash
if [ $#  -eq 1 ];then
       if [ -e  $1 ];then
	    if [ -f  $1  ] ;then
	          echo "file"
	    elif [ -d  $1 ] ;then
	         echo  "dir"
	    else
		echo "unkown"
            fi
       else
	    echo "not  exist"
       fi	

else
	echo "Only 1 arg"
	exit 21
fi
