#!/bin/bash
#写个脚本找出系统中用户的ＵＩＤ在１００－２００之间的用户名和其ＵＩＤ,按顺序排


cat /etc/passwd |sort -t : -k 3 |while read line
	do
	  uid=$(echo $line |cut -d ":" -f 3 )
	  if [ $uid -ge 100 -a $uid -le 200 ];then
		echo  $line |cut -d ":" -f 1,3
	  fi
	done 

#  另外一个
cat /etc/passwd |cut -d ":"  -f 1,3|sort -t ":" -k 2 -n |while  read  line
    do
        uid=$(echo $line |cut -d ":" -f 2)
        if   [ $uid  -ge 100 -a   $uid -le 200 ]; then
            echo  $line
        fi
    done
~         
