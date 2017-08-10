#! /bin/bash
#
#1、输出当前系统有哪些用户（管理者uid==0，程序用户0<uid<1000，普通用户 uid>=1000）
#管理者:
#程序用户:
#普通用户:
#

index=0

for name in $(cut -d":" -f1  /etc/passwd)
do
    uid=$(id -u  $name)
    if [ $uid -eq 0 ]
    then
        root[$index]=$name
    elif test $uid -gt 0 -a $uid -lt 1000   #程序用户
    then
        program[$index]=$name
    else
        regular[$index]=$name 
    fi

    let "index++"
done

echo "管理者   :${root[*]}"
echo
echo "程序用户 :${program[*]}"
echo
echo "普通用户 :${regular[*]}"

exit  0
