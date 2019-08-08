#!/bin/bash

LAT=1942
LON=1989
lat=1943 #区分大小写
LAT=1944 #重新赋值
echo ${LAT} #推荐给所有变量加上花括号
echo ${lat} #取变量的时候加$符号

for skill in php javascript mysql; do
    echo "I am good at ${skill}"
done
