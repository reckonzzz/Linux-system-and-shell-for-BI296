#!/bin/bash
# This program can convert chipseq.txt into processed.txt
# This program is written using grep, sed or awk
# author:张治卓 517111910078
# history:2019/04/24

chr=`grep -o 'chr.' chipseq.txt`
sta=`grep 'Start:.*' chipseq.txt | grep -oE '[0-9]+'`
end=`grep 'End:.*' chipseq.txt | grep -oE '[0-9]+'`
strength=`grep 'Strength:.*' chipseq.txt | awk '{print $2}'`

declare -i i
declare -a Chr Start End Strength
for ((i=1;i<=6;i++))
do
	Chr[$i]=`echo $chr | awk -v i=$i '{print $i}'`
	Start[$i]=`echo $sta | awk -v i=$i '{print $i}'`
	End[$i]=`echo $end | awk -v i=$i '{print $i}'`
	Strength[$i]=`echo $strength | awk -v i=$i '{print $i}'`
	echo -e "${Chr[$i]}\t\t${Start[$i]}\t\t${End[$i]}\t\t${Strength[$i]}"
done
