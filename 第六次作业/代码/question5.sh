#!/bin/bash
# 比较并输出三个数字的最大值和最小值
# author:张治卓 517111910078
# history:2019/05/08

help(){
    echo "You can run this program by using the command line:"
    echo -e "\n\t./question5.sh num1 num2 num3\n"
    echo -e "in which,\n\tnum1,num2,num3 --- the nums"
}

if [[ $# -eq 0 ]]; then
    help
    exit 2
fi

max=$1
min=$1

if [ `echo "$2>$max"|bc` -eq 1 ]; then
    max=$2
fi

if [ `echo "$3>$max"|bc` -eq 1 ]; then
    max=$3
fi

if [ `echo "$2<$min"|bc` -eq 1 ]; then
    min=$2
fi

if [ `echo "$3<$min"|bc` -eq 1 ]; then
    min=$3
fi

echo "max=$max"
echo "min=$min"
