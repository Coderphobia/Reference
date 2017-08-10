#!/bin/bash
# 该脚本用来对指定的目录进行全备份和增量备份
# 在生产环境备份数据时,要注意数据的一致性问题,特别是运行着的数据库备份.(通过快照,或者锁机制实现)
# usage  : ./backup_file.sh  -<f|a>


# Evironment
bakdate=$(date +%F_%H-%M)
sdir="/data/www"
# /data/www的目录中是有很多不同WEB虚拟主机的子目录,每个虚拟主机的目录要单独一个备份包.
ddir="/root/backup"
logdir="$ddir/logs"
errlog="$logdir/error.log"
timefile="$ddir/timefile.msg"
bakserver="192.168.4.222:/$HOME"


usage(){
    cat <<EOF
>>>
    Usage:  ./backup_file.sh  <OPTION>
    Full backup  or  add backup.
       -f    full backup.
       -a    add  backup.

EOF
exit 23
}


if  [ $# -ne 1 ] ;then
	usage
fi

#Mkdir 

[ -d $ddir ] || mkdir -p  "$ddir"
[ -d $logdir ] || mkdir -p  "$logdir"
if  [ ! -d "$sdir" ];then
	echo  "$bakdate  $sdir  is  not exsit." |tee -a "$errlog"
        exit  1
fi


# arg 

case  $1 in 
	-f)
	 method=full
	;;
	-a)
	 method=add
	;;
	*)
	echo "Option unknow."  && usage;
	;;
esac

baklog="$logdir/${bakdate}_${method}.log"


for  website  in $( find  "$sdir" -maxdepth 1  -mindepth 1 -type d )
         do
	     bakfile="$ddir/$(basename  ${website})_${bakdate}_${method}.tar.gz"
	     if [ "$method" = "full" ];then
		tar  -zcf  "$bakfile"  "$website"  &>> "$baklog"
             else
		tar  -N "$timefile"  -zcf  "$bakfile"  "$website"  &>> "$baklog"
	     fi
	     #rsync  -zaqP   "$bakfile"  root@"$bakserver"
	done

# touch a time file

touch  "$timefile"

# remove  the old backup files , a month ago.

#for  i in  $(find  $ddir -name  "*.tar.gz" -mtime +60)
for  i in  $(find  $ddir -name  "*.tar.gz" -mmin +2)
     do
       rm -rf "$i" && echo "Delete $i  sucess." >> "$baklog"
     done
