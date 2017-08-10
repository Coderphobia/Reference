#!/bin/bash
# 检查磁盘分区的使用量，如果某个分区的使用量超过85%，则发警告邮件给管理员。
# 用法,　把该脚本放到计划任务中，定期运行。 

max="85"
email="root"

df -h -t ext4 -P |grep -iv "Filesystem"|while read line
   do
      part=$(echo "$line" |awk '{print $1}')
      use=$(echo "$line" |awk '{print $5}'|cut -d "%" -f 1)
      if  [ "$use"  -gt "$max" ];then
	  echo  "Warning: $part  already used: ${use}%"|mail -s "Running out of disk space"  "$email"
      fi 
   done


