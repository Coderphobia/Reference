#!/bin/bash
#写一个终端闹钟脚本。能够在后台运行，在指定时间点持续发出声音，能够使用选项终止闹钟。（提示：使用echo -e "\a" 发声，使用kill or pkill等结束进程）

ring=/var/www/html/mr-huang/Shell_scripts/08_exmple/aa.sh

usage(){
echo  "USAGE: $0  [HH:MM]"
echo  "USAGE: $0  -s"

cat<<EOF
     HH:MM       set  a  clock at  HH:MM(24).
     -s          stop  ring.
EOF
exit 21
}

add_clock(){
  now_time=$(date +%s)
  clock_time=$(date -d "$time" +%s)
  wait_time=$((${clock_time}-${now_time}))
}

aa_ring(){
    $ring  &
}

stop_ring(){
	rpid=$(ps aux |grep -i "$ring" |awk '{print $2}')
	kill -9 $rpid  &> /dev/null
        exit  
}


#   Script start 

[ $# -ne 1 ] && usage
  case $1 in 
            -s)
	     stop_ring
	     ;;
             *)
	     time=$(echo "$1"|sed -rn '/^[0-2]?[0-9]:[0-5][0-9]$/p')
	     if  [ -z $time ];then
		 usage
	     else
	         add_clock
	     fi
	    ;;  
  esac

while true
    do
       sleep 1
       let  x++
       if [ $x -eq $wait_time ];then
	     aa_ring
	     exit
       fi
    done
