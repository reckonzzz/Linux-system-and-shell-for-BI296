import re
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
    print(result)
    return result


def per_count(condon_list):
    all_condon = {}
    for i in condon_list:
        all_condon[i] = all_condon.get(i, 0) + 1
    total = sum(all_condon.values())
    result = {}
    for i in all_condon:
        result[i] = all_condon[i] / total
    return result


def condon(seq):
    a1 = re.findall(r'.{3}', seq[0::])
    a2 = re.findall(r'.{3}', seq[1::])
    a3 = re.findall(r'.{3}', seq[2::])
    a = a1 + a2 + a3
    per = per_count(a)
    return per


s = create(15)
print(condon(s))

