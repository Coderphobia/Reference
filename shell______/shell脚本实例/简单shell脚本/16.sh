#!/bin/bash
#要求用户输入用户名，如果不输入正确，要求再次输入，重试次数为3次;


user=name
x=0
until  [ $user = "zhangsan" -o $x -ge 3 ] 
	do
            read   -p  "Please  input your username : "  user
	    [ -z $user ] && user=name   
	    let x++
	done
