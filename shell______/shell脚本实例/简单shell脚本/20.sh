#!/bin/bash
# 测试shift

NotUse(){
until [ $# -le 0 ]
        do
                echo "The frist arg:  $1 counts: $#"
                shift 1
        done



# shift 用法的举例 : 1
# 计算1-100的奇数和或者偶数和，将１－１００作为参数传递给脚本
# 用法： 奇数和　　./20.sh   $(seq 1 100)   
# 用法： 偶数和　　./20.sh   $(seq 2 100)   

until [ $# -eq 0 ]
	do
	    let  sum=sum+$1
	    [ $# -eq 1 ] && shift 1
	    shift  2
	done

echo $sum

}





# shift 用法的举例 : 2

# 思考之前写的cmd  -t  -v -i -c 的脚本。
# 如果要求修改为：cmd后面支持的参数是　　-t  -v  -c  -i  -f  filename  , 即其中-f的选项是带参数的。比如这里-f filename　是一组，作用是判断filename是不是一个普通文件。


#方法１

opt_err(){
	echo "Must use  options."
	usage
	exit 20
}

fangfa1(){
[ $# -lt  1  ]  &&  opt_err
a=0
for  i in  "$@"
  do
    case  $i  in 
	-t)
	  date ;;
	-c)
	  cal ;;
	-i)
	  ip  addr show ;; 
	-f)
	  a=1
	  ;;
	-v)
	  echo  "Version :$ver" ;;
	-h)
	  usage ;;
	*)
	  if [ -e $i ];then
	     file=$i
	  else
	     echo "$i Option unknow." 
	  fi
	;;
   esac
  done
if  [ $a -eq 1 ];then
	if  [ -z $file ];then
	    echo "Must have filename for -f option. "
	else
	    if  [ ! -z $file -a  -f $file ];then
	        echo " $file is a File."
	    else
	        echo "$file  type unknow."
	    fi
	fi
fi

}
# 上面的写法不是很好。

# 方法２　使用shift

ver=0.1
[ $# -lt  1  ]  &&  opt_err
until  [ $# -eq 0 ]
do
    case  $1  in
        -t)
          date ;;
        -c)
          cal ;;
        -i)
          ip  addr show ;;
        -f)
          if [ ! -z $2 -a -e $2 ];then
            [ -f $2 ] && echo "$2 is a FILE."  || echo "$2 type UNKNOW."
	    shift 1
	  else
            echo "Must have filename for -f option. "
	  fi
          ;;
        -v)
          echo  "Version :$ver" ;;
        -h)
          usage ;;
        *)
             echo "$1 Option unknow." 
        ;;
   esac
   shift 1
done
