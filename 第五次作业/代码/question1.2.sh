#!/bin/bash
# This program can convert chipseq.txt into processed.txt
# This program is written without using grep, sed or awk
# author:张治卓 517111910078
# history:2019/04/24

declare -i i=1 pos=1 s=0
declare -a Chr Start End Strength

while N= read LINE
do
	s=$pos%5
	if [ $s -eq 0 ];then
		((pos++))
		((i++))
	elif [ $s -eq 1 ];then
		Chr[$i]=${LINE##*:  }
		((pos++))
	elif [ $s -eq 2 ];then
	        Start[$i]=${LINE##*:  }
		((pos++))
	elif [ $s -eq 3 ];then
	        End[$i]=${LINE##*:  }
	        ((pos++))
	elif [ $s -eq 4 ];then
	        Strength[$i]=${LINE##*:  }
	        ((pos++))
	fi
	
	if [ $pos -eq 30 ];then
		for ((i=1;i<=6;i++))
		do
			echo -e "${Chr[$i]}\t\t${Start[$i]}\t\t${End[$i]}\t\t${Strength[$i]}"
		done
	fi
done <"./chipseq.txt"
		

