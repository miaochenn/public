#!/bin/bash

## 变量['局部变量', '环境变量', 'SHELL变量']
LAT=1942
LON=1989
lat=1943 # 区分大小写
LAT=1944 # 重新赋值
URL='www.baidu.com'
readonly URL # 定义为只读变量之后内容不可被改变
echo ${URL}
echo ${LAT}  # 推荐给所有变量加上花括号
echo ${lat}  # 取变量的时候加$符号
unset LON    # 删除变量，不能删除只读变量

## 循环
for skill in php javascript mysql; do
    echo "I am good at ${skill}Script"
done

## 注释 [类似PHP hereDoc]
:<<DOC
多行注释
DOC

## 字符串['单引号', '双引号', '不使用引号']
string="runoob inside"
echo `expr index "${string}" io` # 反引号 查找字符 i 或 o 的位置(哪个字母先出现就计算哪个)

## 数组 [仅支持一维数组 大小没有限制]
persons=('大魔王' '火枪手' 1990S) # 不用逗号分隔
persons[3]='miaochen'

echo ${persons[0]} # 取一个
echo ${persons[@]} # 取所有

## 数组长度
length=${#persons[@]}
echo ${length}
    #OR
length=${#persons[*]}
echo ${length}

## 传递参数
echo $0 # 当前脚本名
echo $1 # 参数1，依次类推
echo $2
echo $3