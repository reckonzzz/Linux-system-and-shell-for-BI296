#!/bin/bash
# This program can generate random DNA sequence of any length \
# with any nucleotide compositions using `shuf` command
# author:张治卓 517111910078
# history:2019/04/25

declare a_num t_num c_num g_num total=0

read -p "请输入DNA序列长度：" length
while [ $total -ne 1 ]
do
	read -p "请输入A核苷酸的组成比例：" a_per
	read -p "请输入T核苷酸的组成比例：" t_per
	read -p "请输入C核苷酸的组成比例：" c_per
	read -p "请输入G核苷酸的组成比例：" g_per
	total=$(printf "%.2f" `echo "$a_per+$t_per+$c_per+$g_per"|bc`)
	total=${total%.*}
	if [ $total -ne "1" ];then
		echo "比例总和不为1，请重新输入比例."
	else
		break
	fi
done
a_num=$(echo "$a_per*$length"|bc)
a_num=${a_num%.*}
t_num=$(echo "$t_per*$length"|bc)
t_num=${t_num%.*}
c_num=$(echo "$c_per*$length"|bc)
c_num=${c_num%.*}
g_num=$(echo "$g_per*$length"|bc)
g_num=${g_num%.*}

touch .temp.txt

for ((i=0;i<a_num;i++)); do echo A >>.temp.txt ; done
for ((i=0;i<t_num;i++)); do echo T >>.temp.txt ; done
for ((i=0;i<c_num;i++)); do echo C >>.temp.txt ; done
for ((i=0;i<g_num;i++)); do echo G >>.temp.txt ; done

shuf .temp.txt | awk BEGIN{RS=EOF}'{gsub(/\n/,"");print}'

rm .temp.txt
