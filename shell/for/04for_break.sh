#! /bin/bash
#

for num in `seq  10`
do
    if [ $num -ge 5 ]
    then
        #打破当前循环
        break
    fi
    echo "$num "
done

echo
echo "====back for num:$num======"
