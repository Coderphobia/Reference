#! /bin/bash
#
#2.把ect目录下的所有.conf结尾的文件拷贝到/tmp/test目录下，并把后缀改为.html
#
#确保/tmp目录下有test目录
if ! test -d  "/tmp/test"
then
    rm -rf /tmp/test
    mkdir  /tmp/test
fi

for  fname  in  $(ls /etc/*.conf)
do
   name=${fname##*/}
   name=${name%.*}
   #echo $name
   \cp  $fname  /tmp/test/${name}.html
done


exit 0
