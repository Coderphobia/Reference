#!/bin/bash
# 这一个脚本演示了函数的使用场景。
# 写一个脚本，让用户输入用户名，如果输入匹配到了内置的用户名，就输出yes和用户名，如果不匹配，就报错，并输出当前的工作路径。
fun1(){
	echo "YES"
	echo "$username"
}
fun2(){
	echo "NO"
	echo "$PWD"
}

read -p  "Please input your name : "  username
case   $username in 
	root)
	   fun1
	  ;;
	zhangsan)
           fun1
	  ;;
        lisi)
           fun1
	  ;;
	*)
        fun2
esac
