#!/bin/bash
# 计算两日期时间差和自1970-01-01至今秒数
# author:张治卓 517111910078
# history:2019/05/09

help(){
    echo "You can run this program by using the command line:"
    echo -e "\n\t./question7.sh date1 date2\n"
    echo -e "in which,\n\tdate<i> --- the two dates you want to calculate in pattern <yyyymmdd> or <yyyy-mm-dd>"
}

if [[ $# -lt 2 ]]; then
    help
    exit 2
fi

date_pattern=^[0-9]\{,4\}\(-?\)[0-9]\{2\}\\1[0-9]\{2\}$
if [[ $1 =~ $date_pattern && $2 =~ $date_pattern ]]; then
    date1=`date -d "$1" +%s`
    date2=`date -d "$2" +%s`
    now=`date +%s`
    diff=$((($date1-$date2)/86400))
    diff=${diff#-}
else
    echo "The dates should be in pattern <yyyymmdd> or <yyyy-mm-dd>"
    exit 0
fi

echo "The difference between two dates is $diff days."
echo "The difference from 1970-01-01 00:00 to now is $now seconds."
