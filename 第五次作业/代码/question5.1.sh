#!/bin/bash
# This program can generate random DNA sequence of length 100 \
# with a certain nucleotide compositions of A(0.30), T(0.30), C(0.20), G(0.20) \
# using `shuf` command
# author:张治卓 517111910078
# history:2019/04/25

touch .temp.txt

for ((i=0;i<30;i++)); do echo A >>.temp.txt ; done
for ((i=0;i<30;i++)); do echo T >>.temp.txt ; done
for ((i=0;i<20;i++)); do echo C >>.temp.txt ; done
for ((i=0;i<20;i++)); do echo G >>.temp.txt ; done

shuf .temp.txt | awk BEGIN{RS=EOF}'{gsub(/\n/,"");print}'

rm .temp.txt
