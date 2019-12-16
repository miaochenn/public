#!/bin/bash

echo ----------"if then elif then fi"
if [ "$(ps -es | grep -c "ssh")" -gt 1 ]; then echo true; fi

pgrep -c "ssh"

if [ $((1 + 1 == 2)) ]; then
    echo true
elif [ $((1 + 1 != 2)) ]; then
    echo false
fi

echo ----------"for 循环"
for num in 1 2 3; do
    echo $num
done

echo ----------"while 循环"
int=1
while ((int <= 5)); do
    echo $int
    ((int++))
done

: <<DOC
echo '按下<Ctrl-C>退出脚本'
echo '按下<Ctrl-D>退出循环'
echo input your films
while read -r FILM; do
    echo yes you like it: "$FILM"
done
DOC
: <<DOC
echo -------------"无限循环"
int=0
while :; do
    ((int++))
    echo $int
done

while true; do
    echo 2
done
DOC

echo -------------until 循环
a=0
until [ ! $a -lt 3 ]; do
    echo $a
    ((a++))
done

echo -------------case 循环
echo 输入一个数字
read -r num
case $num in
1)
    echo 选择1
    ;;
2)
    echo 'select 2'
    ;;
3)
    echo 'select 3'
    ;;
*)
    echo '输入范围超限'
    ;;
esac

: <<DOC
break 终断循环
continue 跳出本次循环
DOC

funcWithReturn() {
    echo input first num
    read -r aNum
    echo input second num
    read -r bNum
    echo a plus b is
    return $((aNum+bNum))
}
funcWithReturn # 调用函数仅使用其函数名即可
echo $? # 函数返回值在调用该函数后通过 $? 来获得

funcWithParam() {
    echo the first param is "$1"
    echo the second param is "$2"
}
funcWithParam firstParam secondParam