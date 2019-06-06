#Question3.2
BEGIN{
    FS=""
}
/^>/{
    print "\n" $0
}
!/^>/{
    for(i=1;i<=NF-2;i++){
        mer1=$i$(i+1)$(i+2)
        if(mer1 in mer_name){}
            else{
                mer_name[i]=mer1
            }
        for(j=1;j<=NF-2;j++){
            mer2=$j$(j+1)$(j+2)
            if(mer1==mer2){
                count+=1
            }
        }
        if(NR==2){
            if(mer1 in mer_array){}
            else{
                mer_array[mer1]=count
                printf("%s的发生频率为%-3d",mer1,mer_array[mer1])
            }
        }
        if(NR==4){
            if((mer1,mer1) in mer_array){}
            else{
                mer_array[mer1,mer1]=count
                printf("%s的发生频率为%-3d",mer1,mer_array[mer1,mer1])
            }
        }
        count=0
    }
}
END{
    for(i=1;i<=NF-2;i++){
        if(mer_name[i] in mer_done){}
        else{
            sum+=(mer_array[mer_name[i]]-mer_array[mer_name[i],mer_name[i]])^2
            mer_done[mer_name[i]]="TRUE"
        }
    }
    score=exp(-sum)
    print "\n发生频率列表为（第一行为3-mer，第二、三行分别为seq1和seq2"
    for(c in mer_done){
        printf("%-4s",c)
    }
    print "\n"
    for(c in mer_done){
        printf("%-4d",mer_array[c])
    }
    print "\n"
    for(c in mer_done){
        printf("%-4d",mer_array[c,c])
    }
    print "\n"
    printf("相似性得分为%f\n",score)
}

