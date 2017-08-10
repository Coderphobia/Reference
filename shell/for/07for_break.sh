#! /bin/bash
#循环嵌套
#

for i in `seq 5`
do
  echo "-------i:$i--------"

  for j in $(seq 8)
  do
    if [ $j -eq 3 ]
    then
        #break  #break 1
        break 2 #打破第二层(从自己开始往外数 自己为第1层)
    fi
    echo  -n "$j "
  done
  echo

done

echo
