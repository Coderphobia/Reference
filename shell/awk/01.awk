#! /usr/bin/awk -f

#开始部分:只执行一次
BEGIN{
  print "===============begin==========="
  #调用系统命令
  system("clear")
  count=0
}
#正文部分:之中的代码每处理以行数据都会执行一次
{
   count++
   if(count%2==0)
   {
      print count
   }
   else
   {
      print "...."
   }
}
#结尾部分:最后执行一次
END{
   print "==================end============="
   system("ls /")
}
