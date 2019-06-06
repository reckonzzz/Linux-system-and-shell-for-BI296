#!/bin/bash
# 根据其所有对应文件的差别对其制作出补丁（patch）
# author:张治卓 517111910078
# history:2019/05/09

help(){
    echo "You can run this program by using the command line:"
    echo -e "\n\t./question8.sh dir dir_copy\n"
    echo -e "in which,\n\tdir --- the original directory\n\tdir_copy --- the copy of the former directory"
}

if [[ $# -lt 2 ]]; then
    help
    exit 2
fi

dir=$1
dir_copy=$2
date=$(date +%Y%m%d)
echo "Generally difference:" > ${date}.patch
diff -uq $dir $dir_copy >> ${date}.patch
echo -e "\n\n\nSpecific difference:" >> ${date}.patch
diff -ur $dir $dir_copy >> ${date}.patch
