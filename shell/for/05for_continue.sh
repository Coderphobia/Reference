#! /bin/bash
#

for num in `seq  10`
do
    if [ $num -eq 5 ]
    then
        #跳过当前循环体<跳过此语句之后的语句>
        continue
    fi
    echo "$num "
done

echo
echo "====back for num:$num======"
