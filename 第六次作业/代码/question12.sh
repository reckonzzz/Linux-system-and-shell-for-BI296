#!/bin/bash
# 检查输入的密码是“强（strong）”、“中等强（medium）”还是“弱（weak）”口令
# author:张治卓 517111910078
# history:2019/05/09

help(){
    echo "You can run this program by using the command line:"
    echo -e "\n\t./question12.sh PASSWD\n"
    echo -e "in which,\n\tPASSWD --- the password you want"
}

if [[ $# -eq 0 ]]; then
    help
    exit 2
fi

num=0
low=0
upp=0
spe=0
count=$(echo $1 | wc -m)
((count--))
spe_pattern=[=@#$%\&*+-]

if [[ $1 =~ [0-9] ]]; then num=1; fi
if [[ $1 =~ [a-z] ]]; then low=1; fi
if [[ $1 =~ [A-Z] ]]; then upp=1; fi
if [[ $1 =~ $spe_pattern ]]; then spe=1; fi

r1=0
r2=0
r3=0

if [ $count -ge 8 ]; then r1=1; fi
if [ $num -eq 1 -a $low -eq 1 -a $upp -eq 1 ]; then r2=1; fi
if [ $spe -eq 1 ]; then r3=1; fi

declare -i r=$r1+$r2+$r3

case $r in
0|1)
    echo "$1 is a weak password"
    ;;
2)
    echo "$1 is a medium password"
    ;;
3)
    echo "$1 is a strong password"
    ;;
esac
