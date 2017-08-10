#! /bin/bash
#

for num in 1 2 3,4 5 6 "hello king"  abc
do
   echo "$num"
done

echo "===========1 ---10============="
for num in `seq 10`
do
   echo -n "$num "
done
echo

echo "===========0 ---10============="
for num in `seq 0 10`
do
   echo -n "$num "
done
echo


echo "===========1 --2-10============="
for num in $(seq 0 2 10)
do
   echo -n "$num "
done
echo

echo "===========10   1============="
for num in $(seq 10 -1 1)
do
   echo -n "$num "
done
echo
