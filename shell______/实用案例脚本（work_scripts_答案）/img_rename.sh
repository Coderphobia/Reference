#/bin/bash
#写一个脚本，要求将目录中所有图片（扩展名是.jpg或者.png或.bmp，名字随机）的名字改成image-01.jpg .. png bmp
#说明: 有下列文件abc.jpg  tt.png xy.jpg  012.jpg  66.png cc.bmp  12b.bmp 456.png  yum.bmp cc.jpg 12b.png
#批量改名成image-01.jpg ... image-04.jpg  image-01.png ... image-04.png  image-01.bmp ... image-03.bmp
#01...04的顺序是由图片的创建(修改)时间的先后顺序来决定.

imgdir=/public

renm(){
     filename=${j%%.*}
     rename  $filename  image-$num $j
     if  [ "$num"  -lt 10 ];then
	rename  image-  image-0  image-?.$i
     fi
	let num++
}

cd $imgdir

for  i in  jpg  png  bmp
     do
	num=1
	for  j in  $(ls -t *.$i )
	   do
	      renm
	   done
     done
