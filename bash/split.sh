#!/bin/bash

file="/Users/${USER}/Desktop/split.txt"

if [ -r $file ]; then
    byte=$(wc -c $file | awk '{print $1}')
    
    if [ $byte -lt 4194304 ]; then
        echo 该文件容量不大 不用做分割处理
        exit
    fi
    
    file_counts=$(($byte / 4194304 + 1)) #结果自动向下取整(数据偏大)
    #file_counts=$(($byte / 30 + 1)) #结果自动向下取整(数据偏大)
     
    total_lines=$(wc -l $file | awk '{print $1}')
    single_file_lines=$(($total_lines / $file_counts + 1))
    
    timestamps=$(date +%s)
    split -l $single_file_lines $file spl_file_${timestamps}_

    ls | grep 'spl_file.*' | while read i; do
        echo "move $i to $i.txt"
        mv $i /Users/${USER}/Desktop/$i.txt
    done

    echo -e '\n\n'
    echo -e "\033[33;33;33m 共分割出 $file_counts 份文件 \033[0m \n"
    echo -e "\033[33;33;33m SUCCESS!!! \033[0m \n"

else
    echo -e '\n\n'
    echo $file 不可读 请设置可读权限
    chmod a+r $file
    echo -e '\n'
    echo -e "\033[33;33;33m 现已自动为你开启该文件的可读权限 请重新执行该脚本 \033[0m \n"
fi
