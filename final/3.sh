#!/bin/bash
a=1
b=1
num=0
echo -ne "$a\t$b\t"
while [ $num -lt 4 ]
do
	let "a=a+b"
	let "b=b+a"
	let "num=num+1"
	echo -ne "$a\t$b\t"
done
