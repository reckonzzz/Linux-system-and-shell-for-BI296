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
    occ = [a_times / total, g_times / total, c_times / total, t_times / total]
    print(occ)
    return result


total = 100
print(create(total))