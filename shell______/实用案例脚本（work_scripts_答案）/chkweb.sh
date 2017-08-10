#!/bin/bash
#监控网站能否正常访问，不能则邮件警告(Ｌinux下命令行的http浏览器：　curl　lynx w3m elinks)

url="http://mr-huang.com/"

umail(){
       echo "$url" is  broken." | mail -s "web check"  root	
}


curl -m 10 -I  "$url"   &> /dev/null
if [ $? -ne 0 ] ;then
	umail
fi
