#!/bin/bash
# 给定一个分数，根据输入的成绩，输出其成绩等级（90+: A; 70-90: B; 60-70: C; 60-: F）
# author:张治卓 517111910078
# history:2019/05/05

help(){
    echo "You can run this program by using the command line:"
    echo -e "\n\t./question1.sh SCORE\n"
    echo -e "in which,\n\tSCORE --- a number between 0 and 100"
}

if [[ $# -eq 0 ]]; then
    help
    exit 2
fi

score=$1
score_=${score%.*}
declare -i cut="$score_/10"

if [ $cut -lt 0 -o $cut -gt 10 ]; then
    echo "The score must range from 0 to 100!"
    exit 0
fi

case $cut in
10)
    if [ $1 == "100" ]; then
        echo "A"
    else
        echo "The score must range from 0 to 100!"
        exit 0
    fi
    ;;
9)
    echo "A"
    ;;
7|8)
    echo "B"
    ;;
6)
    echo "C"
    ;;
[1-5])
    echo "F"
    ;;
0)
    if [ $1 == "0" ]; then
        echo "F"
    else
        echo "The score must range from 0 to 100!"
        exit 0
    fi
    ;;
esac
