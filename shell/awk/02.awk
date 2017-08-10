#! /bin/awk  -f

BEGIN{
   total=0
   FS=":"
}
{
   total+=NF
}
END{
   printf("总字段数:%d\n",total)
}
