#!/bin/bash
# break 和　continue的作用

for i in {1..10}
        do
                [ $i -eq 5 ] && break
                echo "$i"
        done

echo "test  break"

for i in {1..10}
        do
                [ $i -eq 5 ] && continue
                echo "$i"
        done

echo "test  continue"
