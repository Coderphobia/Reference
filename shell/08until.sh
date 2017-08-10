#! /bin/bash
#

i=0

#while [ $i -le 5 ]

#循环直到i > 5
until [ $i -gt 5 ]
do
  echo "i:$i"
  let "i++"
done
