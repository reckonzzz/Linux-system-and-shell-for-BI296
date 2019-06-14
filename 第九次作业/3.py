import random
import math


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


def create_kmer(seq, k):
    d = {}
    for i in range(len(seq) - k + 1):
        temp = seq[i:i + k]
        d[temp] = d.get(temp, 0) + 1
    return d


def gaussian(kmer_1, kmer_2, n):
    sum_a = 0
    for key in (set(kmer_1.keys()) | set(kmer_2.keys())):
        sum_a = sum_a + (kmer_1.get(key, 0) - kmer_2.get(key, 0)) ** 2
    sum_a *= (-1)
    gauss = math.exp(sum_a / n)
    return gauss


k = input("请输入k:")
k = int(k)
print("第一条序列：")
seq1 = create(200)
print("第二条序列：")
seq2 = create(200)
kmer1 = create_kmer(seq1, k)
kmer2 = create_kmer(seq2, k)
print("第一条序列的K-mer：")
print(kmer1)
print(kmer2)
print("Gaussian相似性分值：")
print(gaussian(kmer1, kmer2, 200))

