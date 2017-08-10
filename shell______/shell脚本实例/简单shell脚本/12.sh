#!/bin/bash

# 批量添加n个用户，user1...user10,密码统一为123456

adduser(){
pass="123456"

for i in {1..10}
    do
       useradd   user$i
       echo "$pass" | passwd  --stdin  user$i
    done

}

for  i in {1..10}
    do
	userdel  -rf user$i
    done
