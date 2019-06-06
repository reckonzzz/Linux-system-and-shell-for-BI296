#!/bin/bash
# This program can generate random DNA sequence of length 100 with a 
# certain nucleotide compositions of A(0.30), T(0.30), C(0.20), G(0.20) 
# author:张治卓 517111910078
# history:2019/04/24

declare -a nuc=(A T C G)
declare -i i a=0 t=0 c=0 g=0 random
declare -i a_num=30 t_num=30 c_num=20 g_num=20 length=100

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
