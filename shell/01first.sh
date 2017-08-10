#! /bin/bash
#
#第一行的'#!'指定当前解释器,/bin/bash：以下大码用bash解释  其余行的'#'表示注释
#以行为一条命令,如果同行有多命令用';'隔开
value=100
#访问变量必须用'$'引用
echo "value>>>$value"

temp=$value
echo "temp>>>$temp"

echo "======list /========"
ls /

unset  value
unset  temp

exit  0
