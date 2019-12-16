#!/bin/bash

echo --------------------echo
echo Who are you
read -r name
echo Enter name "$name"

file="/tmp/mytestDir/test-file-notnull.txt"
echo "$name" > $file

echo -e "\n"
echo -e "-e参数开启转译-\n"
echo "转译换行测试"

echo -e "\n"
echo -e "-e参数开启转译-\c"
echo "转译不换行测试"
echo -------------------printf
# shell printf 命令模仿 C 程序库（library）里的 printf() 程序

printf "%-10s %-8s %-4s\n" name sex weight
printf "%-10s %-8s %-4.2f\n" miao male 66.6666
printf "%-10s %-8s %-4.2f\n" wang male 66.6
printf "%-10s %-8s %-4.2f\n" suansuansuan femalemale 66
printf "%d %s hahah\n" 10 I_want_to 

echo -------------------重定向输出
: <<EOL
/dev/null 是一个特殊的文件，写入到它的内容都会被丢弃；如果尝试从该文件读取内容，那么什么也读不到。
但是 /dev/null 文件非常有用，将命令的输出重定向到它，会起到"禁止输出"的效果。
$ command > /dev/null 2>&1
文件描述符 0 通常是标准输入（STDIN），1 是标准输出（STDOUT），2 是标准错误输出（STDERR）

$ command 2 > file 
$ command 2 >> file
$ command > file 2>&1
$ command >> file 2>&1
EOL