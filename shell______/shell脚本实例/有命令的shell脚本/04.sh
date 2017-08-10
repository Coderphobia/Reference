#!/bin/bash
#编写脚本，找出/usr/share/dict/words系统词典中最长的单词

#两种方法：
#  1  把所有的单词的长度都统计，暂存到一个文件，然后再排序。
#  2  冒泡法，依拿后一单词跟前一个比，两两相比，保留比较长的那个。 05.sh
# 　最简单的方法是使用wc -L  找出最长的单词的长度，然后用正则表达式去匹配。



echo "" > /tmp/words.txt

for  i in   $(cat  /usr/share/dict/words)
     do
	len=$(echo $i |wc -m )
	echo  "$len     $i"   >> /tmp/words.txt
     done

cat  /tmp/words.txt |sort -nr |head -n 10




