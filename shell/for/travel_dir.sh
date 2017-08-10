#! /bin/bash

path="/"

for fname in $(ls $path)
do
   echo -n "$fname  type:"
   if test -d $path/$fname
   then
      echo "is dir"
   elif test -f $path/$fname
   then
      echo "is file"
   else
      echo "unknow"
   fi

done
