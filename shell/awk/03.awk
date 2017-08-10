#! /bin/awk  -f
#
#求txt文件中数据平均值
#
BEGIN{
  FS=" "
}
{
  sum=0
  for(i=1;i<=NF;i++)
  {
    sum=sum+$i
  }
  printf("%s 平均值:%f\n",$0,sum/NF)
}

