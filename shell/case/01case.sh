#! /bin/bash

read -p "input a key:" -n 1 ch
echo

case $ch in
  a|A)
    echo "---------------"
    echo "is a. left move"
    echo "---------------"
    ;;
  d|D)
    echo "is d.right move"
    ;;
  w|W)
    echo "is w.up move"
    ;;
  s|S)
    echo "is s. down move"
    ;;
  *)
    echo "unknow"
    ;;
esac
  
