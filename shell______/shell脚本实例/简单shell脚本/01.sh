#!/bin/bash
# 这个脚本统计一个命令执行所花费的时间。
# 为了效果，这个命令执行的时间要稍微长点。
# Version=1.0

start_time=$(date +%s)
find  / -nouser -o  -nogroup  -print >> /tmp/find.log
end_time=$(date +%s)
let  exec_time=${end_time}-${start_time}
echo  $exec_time

