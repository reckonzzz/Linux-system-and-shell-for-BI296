#!/bin/bash
num=$1
n1=$num/1000000
n2=$num%1000000/100000
n3=$num%100000/10000
n4=$num%10000/1000
n5=$num%1000/100
n6=$num%100/10
n7=$num%10
let "rev=$n1+$n2*10+$n3*100+$n4*1000+$n5*10000+$n6*100000+$n7*1000000"
echo $rev
