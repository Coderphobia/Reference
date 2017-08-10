#! /bin/bash

PS3="请选择>"

select  key  in "开  始" "暂  停" "帮  助" "退  出"
do
    #echo "key:$key"

    case  $key in
       "开  始")
          echo "start...."
          ;;
       "暂  停")
          echo "stop ...."
          ;;
       "帮  助")
          echo "help ...."
          ;;
       "退  出")
          break
          ;;
    esac

done
