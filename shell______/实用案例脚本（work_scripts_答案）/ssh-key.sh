#!/bin/bash 
# 自动在本地生成ssh的密钥对，并自动批量将public key上传到远程主机，实现免密码登录。
keydir=$HOME/.ssh
skey=$keydir/id_rsa
pkey=$keydir/id_rsa.pub
passwd="123456"

# genkey

genkey(){
    ssh-keygen -q -f $skey -N ""
    }

# key is exist.

[ -f $skey -a -f $pkey ] || genkey 


# get servername from /etc/hosts

gethosts(){
  syn=n
  until [ "$syn" = "y" ];
     do
	echo "====== Hosts list in /etc/hosts ======="
	grep -Ev 'localhost|^#' /etc/hosts |awk '{print NR,$0}'
	echo 
	unset n
	until [ "$n" -gt 0 ] &>/dev/null;
	do
	   read -p "Please input your select server number(eg: 1 or 123): "  n
	   [ "$n" -gt 0 ] &>/dev/null|| echo "Input error."
	done
	c=`echo "$n" |wc -c`;let c=c-1
	if [ "$c" -gt `grep -Ev 'localhost|^#' /etc/hosts|wc -l` ];then
		echo "Too many servers." ; exit 2
	fi
	unset host_array
	for ((m=1;m<=c;m++))
	     do
		hostn=`echo "$n"|cut -c "$m"`	   
		host_array[$m]=`grep -Ev 'localhost|^#' /etc/hosts |awk -v rn="$hostn" 'NR==rn{print $2}'`
	     done
	echo "You select server is:"
	echo "${host_array[*]}"
	echo
	read -p  "Are you sure[y/n]: " syn
     done
}
gethosts

# upload pub_key.
for i  in ${host_array[*]}
   do
      expect << EOF
      spawn  ssh-copy-id  $i
      expect {
            "*(yes/no)?"  { send "yes\r";exp_continue }
	    "*password:"  { send "$passwd\r";exp_continue }
	    eof { exit }
	    }
EOF
   done
