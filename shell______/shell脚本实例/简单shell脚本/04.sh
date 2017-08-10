#!/bin/bash
#使用$1,判断$1文件类型（是目录还是文件）。
#使用脚本写一个类似file的命令。


errnumber=21
err(){
	echo "Not exist."
	exit $errnumber
}
[ ! -e $1 ] &&  err
[ -d $1 ]  && echo "dir"
[ -f $1 ] && echo "file"
[ -e $1 -a  ! -d $1 -a ! -f $1  ] && echo "This file exist. But type unknow."

