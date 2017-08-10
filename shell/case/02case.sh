#! /bin/bash

read -p "input a key:" -n 1 key
echo

case $key in
   #[[:alnum:]])
   #   echo "数字或字母"
   #   ;;
   [[:digit:]])
      echo "数字"
      ;;
   [[:upper:]])
      echo "大写字母"
      ;;
   [[:lower:]])
      echo "小写字母"
      ;;
   [[:punct:]])
      echo "标点符号"
      ;;
esac

