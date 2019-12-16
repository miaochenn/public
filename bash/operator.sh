#!/bin/bash

## 运算符 [算数 关系 BOOL STRING运算符 文件测试运算符]
: <<EOL
原生bash不支持简单的数学运算，可通过其他命令实现，例如 awk 和 expr，expr 最常用
expr 用法已经过时了，用(())代替

常用算数运算符：+ - * / % = == !=
常用关系运算符：-eq(==) -ne(!=) -gt(>) -lt(<) -ge(>=) -le(<=)
常用布尔运算符：!(非) -o(或) -a(与)
逻辑运算符：&& (AND操作 同 -a) || (OR操作 同 -o) 需要使用双中括号 [[ 运算关系表达式 ]]
常用字符串运算符：= (等于) != (不等于) -z (字符串长度为0返回true) -n (长度不为0返回true) $ (不为空返回true)
文件测试运算符：-r (是否可读) -w -x -s (是否为空，不为空返回true) -d (是否是目录) -e (是否存在) -f (是否是普a通文件（既不是目录，也不是设备文件），如果是，则返回 true) 

EOL

echo "----------运算符"

if [ $((2 + 3)) == 5 ]; then
    echo 算数运算 true
fi

if [ 2 -gt 100 -o 2 -lt 100 ]; then
    echo 关系及布尔运算 true
fi

if [[ 2 -gt 100 || 2 -lt 100 ]]; then
    echo 关系及逻辑运算 true
fi

a=abc

if [ -z $a ]; then
    echo a 字符串为 0
else
    echo a 字符串不为 0
fi

if [ -n $a ]; then
    echo a 字符串不为 0
else
    echo a 字符串不 0
fi

if [ -n "$a" ]; then
    echo a 字符串不为 0
else
    echo a 字符串不 0
fi

if [[ -n $a ]]; then
    echo a 字符串不为 0
else
    echo a 字符串不 0
fi

file1="/tmp/mytestDir/test-file-notnull.txt"
file2="/tmp/mytestDir/test-file-null.txt"

if [ -r $file1 ]; then
    echo $file1 可读
else
    echo $file1 不可读
fi

if [ -r $file2 ]; then
    echo $file2 可读
else
    echo $file2 不可读
fi

echo -----------test 命令，数值测试

a=1
b=2
if test $a = $b; then
    echo true
else
    echo false
fi

res=$((a + b)) # use $((...)) instead of $[]
echo $res
