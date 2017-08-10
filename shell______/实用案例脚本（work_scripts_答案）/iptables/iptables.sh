#!/bin/bash
# iptables shell script.
# hdaojin 
# 2013-4-14
# v0.1
IPTS=/sbin/iptables
MOD=/sbin/modprobe
SHELL_DIR=/shells
MAC_FILE=$SHELL_DIR/allow_mac.txt
NET=192.168.4

### Flush existing rules and set chain policy setting to DROP.
echo "[+] Flushing existing iptables rules ..."
$IPTS -P FORWARD DROP
$IPTS -F
$IPTS -F -t nat
$IPTS -X
$IPTS -N MAC-FORWARD

### filter table start ###
### INPUT chain ###
echo "[+] Setting up INPUT chain ..."
#$IPTS -A INPUT -s $NET.0/24 -d 192.168.1.254 -j REJECT --reject-with icmp-host-unreachable
### OUTPUT chain ###
### FORWARD chain ###
echo "[+] Setting up FORWARD chain ..."
### state tracking rules
$IPTS -A FORWARD -m state --state INVALID -j DROP
$IPTS -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
$IPTS -A FORWARD -i lo -j ACCEPT
$IPTS -A FORWARD -o lo -j ACCEPT
### Alway accept these macs in allow_mac.txt.
$IPTS -A FORWARD -j MAC-FORWARD
grep -v '^#' $MAC_FILE |while read line
	do	
		mac=$(echo "$line"|awk '{print $2}')
		if [ ! -z "$mac" ];then
			$IPTS -A MAC-FORWARD -m mac --mac-source $mac -j ACCEPT
		fi
	done
### filter table end ###
### nat tables start ###
### PREROUTING chain ###
### POSTROUTING chain ###
echo "[+] Setting up nat POSTROUTING chain ..."
$IPTS -t nat -A POSTROUTING  -s $NET.128/25 ! -d $NET.128/25 -j MASQUERADE
### Save iptbales rules 
/sbin/service iptables save
