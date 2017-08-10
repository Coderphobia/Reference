#! /bin/bash
#
#批量创建10个用户test001  test002.....test00n
#    要求密码为 6位随机密码（用大小写字母或数字组成）  所有用户属于 test 组 ，用户第一次登陆必須强制必密码
#    如果该用户已经存在 则将其先删除再创建
#    并在/tmp/userInfo.txt 记录这些用户名与对应的密码
#
#检查test 组是否存在  如不存在则创建
grep  "^Test:"  /etc/group &>  /dev/null
if [ $? -ne 0 ]
then
   groupadd  Test  &> /dev/null
   echo -e "\033[32mcreate <Test> group success\033[0m"
fi

##########################################
echo -n "" > /tmp/userInfo.txt

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
   #get rand password
   #随机库
   ar=(a b c d e f g h i j k m n o p q r s t u v w x y z A B C D E F G H I J K M N O P Q R S T U V W X Y Z 0 1 2 3 4 5 6 7 8 9)
   len=${#ar[*]}
   pas=""
   i=0
   while [ $i -lt 6 ]
   do
       index=$(expr $RANDOM % $len)
       pas=${pas}${ar[$index]}
   
       let "i++"
   done
   #echo $pas
   #set password
   echo "set <test00${nu}> pas"
   echo "$pas" | passwd --stdin  test00${nu}
   #强制改密码
   chage  -d 0  test00${nu}

   #save file
   echo "test00${nu}     $pas"  >> /tmp/userInfo.txt

done
