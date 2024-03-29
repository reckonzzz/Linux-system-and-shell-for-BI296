import random


def random_index():
    index = 0
    randnum = random.randint(1, 100)

    if randnum <= 10:
        index = 0
    elif randnum <= 30:
        index = 1
    elif randnum <= 60:
        index = 2
    elif randnum <= 100:
        index = 3
    return index


def create(total):
    arr = ['A', 'G', 'C', 'T']
    result = ''

    a_times = 0
    g_times = 0
    c_times = 0
    t_times = 0
    for i in range(total):
        index = random_index()
        if arr[index] == 'A':
            a_times += 1
            result += 'A'
        elif arr[index] == 'G':
            g_times += 1
            result += 'G'
        elif arr[index] == 'C':
            c_times += 1
            result += 'C'
        elif arr[index] == 'T':
            t_times += 1
            result += 'T'

    occ = [a_times/total, g_times/total, c_times/total, t_times/total]
    return occ


def main():
    length = [100, 200, 500, 1000, 5000, 10000, 50000, 100000]
    re1 = []
    re2 = []
    count1 = count2 = 0
    for total in range(0, 1000):
        total = 100
        occ = create(total)
        re1.append(occ)
    for i in re1:
        if (abs(i[0] - 0.1) + abs(i[1] - 0.2) + abs(i[2] - 0.3) + abs(i[3] - 0.4)) < 0.05:
            count1 += 1
    for total in range(0, 1000):
        total = 1000
        occ = create(total)
        re2.append(occ)
    for i in re2:
        if (abs(i[0] - 0.1) + abs(i[1] - 0.2) + abs(i[2] - 0.3) + abs(i[3] - 0.4)) < 0.05:
            count2 += 1
    print(count1)
    print(count2)


main()
