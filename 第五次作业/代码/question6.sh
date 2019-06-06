#!/bin/bash
# This program can generate random DNA sequence of any length 
# with any nucleotide compositions
# author:张治卓 517111910078
# history:2019/04/24

declare -a nuc=(A T C G)
declare -i i a=0 t=0 c=0 g=0 random length
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

while [ $length -gt 0 ]
do
	random=$(($RANDOM%4))
	if [[ ${nuc[$random]} == "A" ]];then
		if [ $a -lt $a_num ];then
			result=${result}A
			((a++))
			((length--))
		fi
	elif [[ ${nuc[$random]} == "T" ]];then
		if [ $t -lt $t_num ];then
			result=${result}T
			((t++))
			((length--))
		fi
	elif [[ ${nuc[$random]} == "C" ]];then
		if [ $c -lt $c_num ];then
			result=${result}C
			((c++))
			((length--))
		fi
	elif [[ ${nuc[$random]} == "G" ]];then
		if [ $g -lt $g_num ];then
			result=${result}G
			((g++))
			((length--))
		fi
	fi
	if [ $length -eq 0 ];then
		echo $result
	fi
done
