#/bin/bash
# if的示例当中有个要求用户输入Ｙ/Ｎ脚本的举例。在判断用户输入的时候，考虑到几乎所有的情况：
# 用户可能会输入：　Ｙ　y  yes YES Yes  N n no NO No
# 用case来完成。

read  -p "Inpu (yes/no): " yn
case  $yn in 
	Y)
	 echo "OK" ;;
        y)
	 echo "OK" ;;
        yes)
	  echo "OK" ;;
        YES)
	  echo "OK" ;;
          N)
	   echo "exit" ;;
	  n)
	   echo "exit" ;;
	  NO)
	   echo "exit" ;;
	  no)
	    echo "exit" ;;
	  *)
	    echo "sorry" ;;
esac


# 代码还是太重复繁琐。可以通过正则表达式来进行匹配大小写，长短输入的情况。
# 后面学了正则表示式再写。


