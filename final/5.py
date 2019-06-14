def reverse_num(num):
    res = []
    for i in str(num):
        res.append(int(i))
    rev = 1000000 * res[6] + 100000 * res[5] + 10000 * res[4] + 1000 * res[3] + 100 * res[2] + 10 * res[1] + res[0]
    print(rev)


reverse_num(1234567)

