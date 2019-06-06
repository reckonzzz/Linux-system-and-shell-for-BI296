#!/bin/bash
# 输出年月日
# author:张治卓 517111910078
# history:2019/05/08

help(){
    echo "You can run this program by using the command line:"
    echo -e "\n\t./question3.sh DATE\n"
    echo -e "in which,\n\tDATE --- date in pattern <m/d/y>"
}

if [[ $# -eq 0 ]]; then
    help
    exit 2
fi

day=$1
IFS="/"

declare -a dd
dd=($day)

if [ ${dd[2]} -lt 0 ]; then
    echo "Year is out of range!"
    exit 0
fi

if [ ${dd[0]} -lt 1 -o ${dd[0]} -gt 12 ]; then
    echo "Month is out of range!"
    exit 0
fi

case ${dd[0]} in
1|3|5|7|8|10|12)
    if [ ${dd[1]} -lt 1 -o ${dd[1]} -gt 31 ]; then
        echo "Day is out of range!"
        exit 0
    fi
    ;;
4|6|9|11)
    if [ ${dd[1]} -lt 1 -o ${dd[1]} -gt 30 ]; then
        echo "Day is out of range!"
        exit 0
    fi
    ;;
2)
    a=`echo "${dd[2]}%4" | bc`
    b=`echo "${dd[2]}%100" | bc`
    if [ $a -eq 0 -a $b -ne 0 ]; then
        if [ ${dd[1]} -lt 1 -o ${dd[1]} -gt 29 ]; then
            echo "Day is out of range!"
            exit 0
        fi
    else
        if [ ${dd[1]} -lt 1 -o ${dd[1]} -gt 28 ]; then
            echo "Day is out of range!"
            exit 0
        fi
    fi
    ;;
esac

echo "Year: ${dd[2]}"
echo "Month: ${dd[0]}"
echo "Day: ${dd[1]}"
