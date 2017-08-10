#! /bin/bash
#循环嵌套
#

for i in `seq 5`
do
  echo "-------i:$i--------"

  for j in $(seq 8)
  do
    echo  -n "$j "
  done
  echo

done
