#!/bin/bash
# 将目录下的所有.c文件更名为.h文件
# author:张治卓 517111910078
# history:2019/05/09

help(){
    echo "You can run this program by using the command line:"
    echo -e "\n\t./question10.sh DIR_PATH\n"
    echo -e "in which,\n\tDIR_PATH --- the path of dir"
}

if [[ $# -eq 0 ]]; then
    help
    exit 2
fi

for file in $1/*.c
do
        name=${file%%.c}
        mv $file $name.h
done
