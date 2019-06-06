#!/bin/bash
# 计算文件中的数值的平均值和标准偏差
# author:张治卓 517111910078
# history:2019/05/09

help(){
    echo "You can run this program by using the command line:"
    echo -e "\n\t./question11.sh FILE_PATH\n"
    echo -e "in which,\n\tFILE_PATH --- the path of file"
}

if [[ $# -eq 0 ]]; then
    help
    exit 2
fi

sum=0
count=0

while N= read LINE
do
    sum=$(echo "scale=4;$sum+$LINE"|bc -l)
    ((count++))
done < $1

avg=$(echo "scale=4;$sum/$count"|bc -l)

sum_sd=0

while N= read LINE
do
    sum_sd=$(echo "scale=4;$sum_sd+($LINE-$avg)^2"|bc -l)
done < $1
sd=$(echo "scale=4;sqrt($sum_sd/($count-1))"|bc -l)

echo -e "Number of data points in "test.dat" = $count\nArithmetic mean (mu) = $avg\nStandard Deviation (sigma) = $sd"
