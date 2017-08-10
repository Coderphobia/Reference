#! /bin/bash
#100以内的偶数

echo "100以内的偶数:"
for num in $(seq 100)
do
   if [ $((num%2)) -eq 0 ]
   then
      echo -n "$num "
   fi
done

echo

exit 0
