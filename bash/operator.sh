#!/bin/bash

## 运算符 [算数 关系 BOOL STRING运算符 文件测试运算符]
:<<EOL
原生bash不支持简单的数学运算，可通过其他命令实现，例如 awk 和 expr，expr 最常用
expr 用法已经过时了，用(())代替

常用算数运算符：+ - * / % = == ！=
常用关系运算符：-eq(==) -ne(!=) -gt(>) -lt(<) -ge(>=) -le(<=)

EOL

echo "----------算数运算"
echo $((2 / 2))

if [ 2 < 3 ]
then
    echo true
fi
