#!/bin/bash
# 查找网站中的无效链接
# 

usage(){
    echo -e " \nUSAGE: $0 http://www.example.com\n"
    exit 1
    }

if [ $# -ne 1 ];then
    usage
    exit 23
fi

mkdir  /tmp/$$.lynx
cd  /tmp/$$.lynx

lynx -traversal $1 > /dev/null

count=0

sort -u   reject.dat  > links.txt

echo "Broken links: "

while read link
 do 
	curl -s -I $link | grep 'HTTP/.*OK' &> /dev/null
	# 要匹配准确的话，还要考虑比如301,302等跳转的状态。 
	if  [ $? -ne 0 ];then
	    echo $link
	    let count++
	fi
 done < links.txt

 [ $count -eq 0 ] && echo "No broken links found."

cd $HOME
rm -rf  /tmp/$$.lynx

