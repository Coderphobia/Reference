#! /bin/bash
#
#2.输入一个整数成绩 如果小于60 输出 差   如果60<=value<80 输出良  如果大等于80 输出 优
#
echo -n "input a  int score:"
read score

if test $score -lt 60
then
   echo "差"
elif [ $score -ge 60 -a $score -lt 80 ]
then
   echo "良"
else
   echo "优"
fi

exit 0
