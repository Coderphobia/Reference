#! /bin/bash

#随机库
ar=(a b c d e f g h i j k m n o p q r s t u v w x y z A B C D E F G H I J K M N O P Q R S T UV W X Y Z 0 1 2 3 4 5 6 7 8 9)
len=${#ar[*]}

ps=""
i=0
while [ $i -lt 6 ]
do
    index=$(expr $RANDOM % $len)
    ps=${ps}${ar[$index]}

    let "i++"
done

echo $ps
