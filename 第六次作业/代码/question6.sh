#!/bin/bash
# 判断输入的值是否为整数，并计算给定整数阶乘
# author:张治卓 517111910078
# history:2019/05/08

help(){
    echo "You can run this program by using the command line:"
    echo -e "\n\t./question6.sh num\n"
    echo -e "in which,\n\tnum --- a number"
}

if [[ $# -eq 0 ]]; then
    help
    exit 2
fi
num=$1

isInt(){
    int_pattern=^[0-9]+$
    if [[ $1 =~ $int_pattern ]]; then
        echo "$1 is an integer"
        return 0
    else
        echo "$1 is not an integer"
        return 1
    fi
}

factorial(){
    declare -i fac=1;
    if [ $1 -eq 0 ]; then
        echo "factorial of $1 is 0"
    else
        for i in $(seq 1 $1)
        do
            fac=$((i*fac))
        done
        echo "factorial of $1 is $fac"
    fi
}

isInt $num
if [ $? -eq 0 ]; then
    factorial $num
fi
