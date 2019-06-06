#!/bin/bash
# 将所有大写字母转换为小写字母，并将其写回文件
# author:张治卓 517111910078
# history:2019/05/09

help(){
    echo "You can run this program by using the command line:"
    echo -e "\n\t./question9.sh FILE_PATH\n"
    echo -e "in which,\n\tFILE_PATH --- the path of file"
}

if [[ $# -eq 0 ]]; then
    help
    exit 2
fi

if [[ -f $1 ]]; then
    cat $1 | tr -t 'a-z' 'A-Z' > .bash_temp
    cat .bash_temp > $1
    rm .bash_temp
else
    echo "File doesn't exist!"
fi
