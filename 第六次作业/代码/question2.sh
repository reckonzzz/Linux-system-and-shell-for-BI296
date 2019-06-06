#!/bin/bash
# 打包文件夹下的所有普通文件
# author:张治卓 517111910078
# history:2019/05/08

help(){
    echo "You can run this program by using the command line:"
    echo -e "\n\t./question2.sh DIR_PATH\n"
    echo -e "in which,\n\tDIR_PATH --- the path of dir"
}

if [[ $# -eq 0 ]]; then
    help
    exit 2
fi

dir_path=$1
file_names=`ls -al | grep "^-" | awk '{print $NF}'`

if [ -d $dir_path ]; then
            tar -zcvf dir_packup.tar $file_names
else
    echo "The path does not refer to a dir!"
fi
