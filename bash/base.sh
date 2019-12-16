#!/bin/bash

## 变量['局部变量', '环境变量', 'SHELL变量']
LAT=1942
LON=1989
lat=1943 # 区分大小写
LAT=1944 # 重新赋值
URL='www.baidu.com'
readonly URL # 定义为只读变量之后内容不可被改变
echo -----------变量
echo ${URL}
echo ${LON}
echo ${LAT} # 推荐给所有变量加上花括号
echo ${lat} # 取变量的时候加$符号
unset LON   # 删除变量，不能删除只读变量

echo $URL
## 循环
for skill in php javascript mysql; do
    echo "I am good at ${skill}Script"
done

## 注释 [类似PHP hereDoc]
: <<DOC
多行注释
DOC

## 字符串['单引号', '双引号', '不使用引号']
#string="runoob inside"
#echo `expr index "$string" io`  # 反引号 查找字符 i 或 o 的位置(哪个字母先出现就计算哪个)
echo string
echo "string" # 双引号有解析作用
echo 'string'

## 数组 [仅支持一维数组 大小没有限制]
echo ----------数组
persons=('大魔王' '火枪手' 1990S) # 元素用空格分开
persons[3]='miaochen'

echo ${persons[0]}   # 取一个
echo "${persons[@]}" # 取所有
echo ${persons[*]}   # 取所有， * @ 数组取值时完全相同，做外部接收参数用时不同

## 数组长度
length=${#persons[@]}
echo ${length}
#OR
length=${#persons[*]}
echo ${length}

## 传递参数
echo ----------传递参数
echo "$0" # 当前脚本名
echo "$1" # 参数1，依次类推
echo "$2"
echo "$3"
echo "$#" # 传递到脚本的参数个数
echo "$*" # 以一个单字符串显示所有向脚本传递的参数 等同与 "$1 $2 $n ..." 全部参数拼起来成为一个变量输出
echo "$$" # 脚本运行的当前进程ID号
echo "$!" # 后台运行的最后一个进程的ID号
echo "$@" # 类似$* 等同与 "$1" "$2" "$n" ...一起输出，变量个数仍是n个
echo "$-" # 显示Shell使用的当前选项，与set命令功能相同
echo "$?" # 显示最后命令的退出状态。0表示没有错误，其他任何值表明有错误

echo "----------\$*演示"
for i in "$*"; do
    echo "$i"
done

echo "----------\$@演示"
for i in "$@"; do
    echo "$i"
done
# run ./test.sh aaa bbb ccc