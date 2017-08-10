#! /bin/bash
#
#1、批量创建10个用户test001  test002.....test00n
#    要求密码为 123  所有用户属于 Test 组 ，用户第一次登陆必須强制改密码
#    如果该用户已经存在 则将其先删除再创建
#
#检查test 组是否存在  如不存在则创建
grep  "^Test:"  /etc/group &>  /dev/null
if [ $? -ne 0 ]
then
   groupadd  Test  &> /dev/null
   echo -e "\033[32mcreate <Test> group success\033[0m"
fi

##########################################
#for i  in a b c d e f
for nu  in $(seq 10)
do
   #check test00$nu is exist ?
   id test00${nu} &> /dev/null
   if test $? -eq 0
   then
       echo "del user <test00${nu}>"
       userdel  -r  test00${nu}  &>  /dev/null
   fi
   #create user
   echo "add user <test00${nu}>"
   useradd  -g Test  test00${nu}  &> /dev/null
   #set password
   echo "set <test00${nu}> pas"
   echo "123" | passwd --stdin  test00${nu}
   #强制改密码
   chage  -d 0  test00${nu}
done
