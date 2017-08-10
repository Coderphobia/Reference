#!/bin/bash
# 远程对集群中的节点进行批量初始化的操作。
#sure(){
#	read -p "Are you #sure?[y/n]" yn
#	[ "$yn" != "y" ] && continue
#	}
sendsshkey(){
	echo "===== Send ssh key to $host ......"
	[ ! -f "$HOME"/.ssh/id_*.pub ] && ssh-keygen
	ssh-copy-id "$host"
	echo "****** Send ssh key finish."
	}
	
setyum(){
	echo "====== Set yum for $host ......"
	#sure
	ssh "$host" "echo -n >/etc/yum.repos.d/iso.repo"
	for line in `awk '{print $0}' < /etc/yum.repos.d/iso.repo`
	do
	   ssh "$host" "echo $line >> /etc/yum.repos.d/iso.repo"
	done
	echo "****** Set yum finish."
	ssh "$host" "cat /etc/yum.repos.d/iso.repo"
	}
installsshc(){
	echo "====== Install openssh-clients for $host ......"
	#sure
	ssh "$host" "yum -y install openssh-clients >/dev/null"
	echo "****** Install openssh-clients finish."
	ssh "$host" "which scp"
	}
sethostname(){
	echo "====== Set hostname for $host ......"
	#sure
	ssh "$host" "hostname  $host"
	ssh "$host" "sed -i '/HOSTNAME/c HOSTNAME="$host"' /etc/sysconfig/network"
	echo "****** Set hostname finish."
	ssh "$host" "hostname ; cat /etc/sysconfig/network"
	}
sethosts(){
	echo "====== Set hosts for $host ......"
	#sure
	grep -Ev '^#|#' /etc/hosts > /tmp/hosts.tmp
	ssh "$host" "rm -rf /etc/hosts"
	scp /tmp/hosts.tmp "$host":/etc/hosts
	rm -rf /tmp/hosts.tmp
	echo "****** Set hosts finish."
	ssh "$host" "cat /etc/hosts"
	}
setfirewall(){
	echo "====== Set iptables for $host ......"
	#sure
	ssh "$host" "service iptables stop ; chkconfig iptables off"
	echo "****** Set iptables finish."
	ssh "$host" "iptables -nL"
	}
setselinux(){
	echo "====== Set selinux for $host ......"
	#sure
	ssh "$host" "setenforce 0"
	ssh "$host" "sed -i '/SELINUX=enforcing/c SELINUX=disabled' /etc/selinux/config" 
#	ssh "$host" "sed -i '/SELINUX=enforcing/c SELINUX=disabled' /etc/sysconfig/selinux" 
	echo "****** Set selinux finish."
	ssh "$host" "getenforce ; grep -i '=disabled' /etc/selinux/config /etc/sysconfig/selinux"
	}
setntp(){
	echo "====== Set ntp for $host ......"
	#sure
	ssh "$host" "yum -y install ntpdate > /dev/null"
	ssh "$host" "echo -e '192.168.1.71\n192.168.122.1' >> /etc/ntp/step-tickers"
	ssh "$host" "sed -i '/SYNC_HWCLOCK=no/c SYNC_HWCLOCK=yes' /etc/sysconfig/ntpdate"
	ssh "$host" "echo '30 * * * * root service ntpdate start' >> /etc/crontab"
	ssh "$host" "service ntpdate start"
	echo "****** Set ntp finish."
	ssh "$host" "date ; grep -i ntpdate /etc/crontab"
	}
setacpi(){
	echo "====== Set acpi for $host ......"
	#sure
	ssh "$host" "service acpid stop ; chkconfig acpid off"
	echo "****** Set acpi finish."
	ssh "$host" "service acpid status; chkconfig --list |grep acpid"
	}
installnode(){
	echo "====== Install High Availability for $host ......"
	#sure
	ssh "$host" "unset LANG ; yum -y groupinstall 'High Availability' > /dev/null"
	ssh "$host" "echo '123456'|passwd --stdin ricci"
	ssh "$host" "service ricci start ; chkconfig ricci on"
	echo "****** Install  High Availability finish"
	ssh "$host" "netstat -ntupl |grep ricci ; chkconfig --list |grep ricci"
	}
installgfs(){
	echo "====== Install Resilient Storage for $host ......"
	#sure
	ssh "$host" "unset LANG ; yum -y groupinstall 'Resilient Storage' > /dev/null"
	echo "****** Install  Resilient Storage finish"
	ssh "$host" "rpm -qa |grep -E '(lvm2-cluster|gfs)'"
	}
installconga(){
	echo "====== Install High Availability Management for $host ......"
	#sure
	ssh "$host" "unset LANG ; yum -y groupinstall 'High Availability Management' > /dev/null"
	ssh "$host" "service luci start ; chkconfig luci on"
	echo "****** Install  High Availability Management finish"
	ssh "$host" "netstat -ntupl |grep luci ; chkconfig --list |grep luci"
	
	}
installiscsic(){
	echo "====== Install iscsi-initiator-utils for $host ......"
	#sure
	ssh "$host" "yum -y install 'iscsi-initiator-utils' > /dev/null"
	echo "****** Install iscsi-initiator-utils finish."
	ssh "$host" "rpm -qa |grep iscsi"
	}
installiscsis(){
	echo "====== Install scsi-target-utils for $host ......"
	#sure
	ssh "$host" "yum -y install 'scsi-target-utils' > /dev/null"
	echo "****** Install scsi-target-utils finish."
	ssh "$host" "rpm -qa |grep scsi"
	}
runcmd(){
	echo "====== Run the command of your specifying for $host ......"
	if [ -z "$cmd" ];then
		read -p "Enter your comand in here: " cmd
	fi
	ssh "$host" "$cmd"
#	echo "****** Run command finish."
	}
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
echo
echo "Please Input the serial number of function."
echo
select i in sendsshkey setyum installsshc sethostname sethosts setfirewall setselinux setntp setacpi installnode installgfs installiscsic installconga installiscsis runcmd quit
	do
	[ "$i" = "quit" ] && exit
	[ "$i" = "runcmd" ] && unset cmd
	for host in ${host_array[*]}
	     do
		"$i"
	     done
	done
