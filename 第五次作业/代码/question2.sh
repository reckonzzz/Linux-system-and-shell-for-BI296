#!/bin/bash
#This program can calculate the sequence length and output 
#the sequence name and its corresponding length
#author:张治卓 517111910078
#history:2019/04/24

file="./regions.fas"
declare -i i=1 pos=1 row_num s seq_num
declare -a name length
row_num=`cat $file | wc -l`
seq_num=$(($row_num/2))

while N= read LINE
do
	s=$pos%2
	if [ $s -eq 1 ];then
		name[$i]=${LINE%% length*}
		((pos++))
	elif [ $s -eq 0 ];then
		length[$i]=`echo -n $LINE | wc -c`
		((i++))
		((pos++))
	fi
	
	if [ $pos -eq $row_num ];then
		for ((i=1;i<=seq_num;i++))
		do
			echo ${name[$i]}
			echo "length = ${length[$i]}"
		done
	fi
done <"$file"
