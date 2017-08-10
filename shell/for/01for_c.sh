#!  /bin/bash
#
#C风格语法
#i=0：初始化部分<只在最开始时执行一次>
#i<5 :条件判断部分
#i++ :调整部分
for((i=0;i<5;i++))
do
  #循环体
  echo "i:$i"
done

echo "===back for i:$i===="
