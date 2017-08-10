#! /bin/bash

while :
do
   echo "+++++++++++"
   echo "+1.开   始+"
   echo "+2.暂   停+"
   echo "+3.帮   助+"
   echo "+4.退   出+"
   echo "+++++++++++"
   read -p "请选择>" num

   case $num in
      1)
        echo "start...."
        ;;
      2)
        echo "stop ...."
        ;;
      3)
        echo "help ....."
        ;;
      4)
        break
       ;;
   esac

done

echo "==========over==========="

exit 0
