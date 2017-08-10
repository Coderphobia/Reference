#!/bin/bash
#1. 要求输入用户名，如果是root，输出admin，如果是chuyue，那么输出normal,如果是其他的，那么输出user not exist.
#2. 上面的题再加上要求验证密码，假设root的密码是redhat，chuyue的密码是123456.


read  -p "Please input your username : "   user
read  -p "Please input your password : "   pass

# 方法１，　以下用函数括起来，不引用，就不执行。意思暂时不用这段旧的代码。

notuse(){
if  [ "$user" = "root"  ] ;then
    if [ "$pass" = "redhat" ] ;then 
	echo  "admin"
    else
	echo  "sorry."
    fi
elif [ "$user" =  "chuyue" ] ;then
    if  [ "$pass" = "123456" ] ;then
	echo "normal"
    else
	echo "sorry."
    fi
else
      echo "user not exist."
fi 

}
# 以上的程序代码不够精减。换一种写法：

up=$user-$pass
if  [ $up  = "root-redhat" ];then
	echo "admin"
elif [ $up = "chuyue-123456" ];then
        echo "normal"
else
     echo "username or  password  error."
fi
