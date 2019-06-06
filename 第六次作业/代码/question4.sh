#!/bin/bash
# 输出登录shell为bash的用户
# author:张治卓 517111910078
# history:2019/05/08

IFS=":"

while read f1 f2 f3 f4 f5 f6 f7
do
    if [ $f7 == "/bin/bash" ]; then
        echo "$f1 is bash user"
    fi
done < /etc/passwd
