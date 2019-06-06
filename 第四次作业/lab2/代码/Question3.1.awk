#Question 1
BEGIN{
    FS=""
}
/^>/{
	print $0
}
!/^>/{
    s_length=NF
    for(i=1;i<=NF;i++){
        if($i=="A") A++
        else if($i=="T") T++
        else if($i=="C") C++
        else if($i=="G") G++
        else break;
    }
    A_percentage=A/s_length
    C_percentage=C/s_length
    G_percentage=G/s_length
    T_percentage=T/s_length
    A_total+=A
    C_total+=C
    G_total+=G
    T_total+=T
    total+=s_length
    printf("Sequnce Length:%d\n",s_length)
    printf("A:%d\t",A)
    printf("C:%d\t",C)
    printf("G:%d\t",G)
    printf("T:%d\n",T)
    printf("A percentage:%f\n",A_percentage)
    printf("C percentage:%f\n",C_percentage)
    printf("G percentage:%f\n",G_percentage)
    printf("T percentage:%f\n",T_percentage)
    printf("\n")
	A=0
	C=0
	G=0
	T=0
}
END{
    printf("Overall A percentage: %2.2f\n",A_total/total*100)
    printf("Overall C percentage: %2.2f\n",C_total/total*100)
    printf("Overall G percentage: %2.2f\n",G_total/total*100)
    printf("Overall T percentage: %2.2f\n",T_total/total*100)
}
