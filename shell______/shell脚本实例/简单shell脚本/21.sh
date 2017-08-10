#!/bin/bash

# select的用法，select呈现给用户一个菜单。

select  i in  ls  pwd  aa  quit
       do
	  if [ $i = "aa" ] ;then
	      echo "Just a test."
	  elif [ $i = "quit" ];then
	      exit 0
	  else
	      $i
	  fi
       done
