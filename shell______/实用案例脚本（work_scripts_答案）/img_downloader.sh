#/bin/bash
# Desc: Images downloader
#
# Usage: ./img_downloader  URL  -d DIRECTORY

down_dir="$HOME/imgs"



usage(){
      echo "Usage: ./img_downloader  URL  -d DIRECTORY"
      exit  1
      }

if [ $#  -ne 3 ];then
      usage
fi

while [ "$#" -gt 0 ]
   do
      case  "$1" in
         -d)
	  shift
	  down_dir="$1"
	  ;;
	 *)
	  url=$1
	  ;;
      esac
      shift
   done

[ ! -d "$down_dir" ] && mkdir -p "$down_dir"

baseurl=$(echo "$url"|awk -F "/" '{print $1"//"$3}')
#baseurl="$baseurl"/main

curl -4 -m 60 -s $url |egrep -o '<img .+>'|sed   's/\(^<img .*\)\(src=\"\)\([^\"]\{1,\}\)\(\".*$\)/\3/'|while read img_url 
     do 
        echo "$img_url"|egrep -q "https?://" 
        if [ "$?" -ne 0 ];then
          img_url="$baseurl"/"$img_url"
        fi
	wget "$img_url" -P "$down_dir"
     done
