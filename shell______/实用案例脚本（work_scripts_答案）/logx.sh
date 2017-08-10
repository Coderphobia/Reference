#!/bin/bash
# 由logger.sh不断的产生新的日志到/var/log/test.log
#针对上面脚本产生的日志进行切割,要求每10s钟切割一次,保留3个备份,备份的日志名为test.log.01  test.log.02  test.log.03

logdir=/var/log
logfile=test.log
baknum=4

rotate(){
    cd  $logdir
    for  logs  in  $( ls -r ${logfile}* 2>/dev/null )
	do
         [ -z  "$logs" ] && continue
	 newname=$( echo $logs |awk 'BEGIN{FS=".";OFS="."}{print $1,$2,"0"$3+1}')
         rename $logs  $newname   $logs
	done
    touch $logfile
    /bin/kill -HUP  $(cat  /var/run/syslogd.pid  2>/dev/null ) 2> /dev/null ||true
}


delold(){
    lastlogf="${logdir}/${logfile}.0${baknum}"
    rm -rf  ${lastlogf} 
}


while  true
     do
	rotate
	delold
	sleep 10
     done
