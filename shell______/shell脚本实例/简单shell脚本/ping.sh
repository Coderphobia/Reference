#!/bin/bash

# 查看本网段哪些IP正在使用？
# 要求使用ping的方法，ping得通表示该ip正在使用。


net=172.25.254
ip_use_file=/tmp/ip.txt
num=0
echo ""> $ip_use_file
for i in {1..254}
     do
	(
	ok=1
        for ((x=1;x<=3;x++))
	do
       	   ping  -c 1 $net.$i  &> /dev/null
	   if [ $? -eq 0 ] ; then
	       ok=0
	       break
	   fi
	done
	if [ $ok = 0 ];then
	       echo "$net.$i  is up." >> ${ip_use_file}
	else
	       echo "$net.$i  is down" >> ${ip_use_file}
	fi
	) &
    done

while true 
     do
        sleep 1
	num=$(grep  "$net"  ${ip_use_file} |wc -l )
	if [ $num -eq 254 ];then
	    echo  "$(grep "up" ${ip_use_file} |wc -l) IPs is up "
	    echo  "$(grep "down" ${ip_use_file} |wc -l) IPs is down "
	    echo  " IP List : "
	    grep  "up" ${ip_use_file} |sort -t "."  -k 4  -n 
	    grep  "down" ${ip_use_file} |sort -t "."  -k 4  -n 
	    break
	fi	
     done

FF(){
until [ $num -eq 254 ]
     do
	num=$(grep  "$net"  ${ip_use_file} |wc -l )
        sleep 1
     done
	echo  "$(grep "up" ${ip_use_file} |wc -l) IPs is up "
	echo  "$(grep "down" ${ip_use_file} |wc -l) IPs is down "
	echo  " IP List : "
	cat ${ip_use_file} | sort -t "."  -k 4  -n 
}
