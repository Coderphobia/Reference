#!/bin/bash
#判断输入的字符类型（字符，奇数，偶数）？

read  -p  "Please input a char : "  char
err(){
       echo  "NO  char."
       exit  2
}

chars(){
	echo  "Character string."
	exit 0
}
	
[ -z  "$char" ] &&  err
[ "$char"   -ge  0 ] 2>/dev/null || chars
let  i="$char"%2 
[ "$i" =  0 ]  && echo "Even numbers"  || echo "Odd numbers"
