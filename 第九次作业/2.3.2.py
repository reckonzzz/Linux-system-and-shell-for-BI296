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

    percent_all = [a_times/total, g_times/total, c_times/total, t_times/total]
    print("total: %5d  A: %4d  G: %4d  C: %4d  T: %4d" % (total, a_times, g_times, c_times, t_times))
    # print("%0.3f %0.3f %0.3f %0.3f" % (a_times/total, g_times/total, c_times/total, t_times/total))
    return percent_all


def k_test(percent_all):
    percent = [0, 0, 0, 0]
    percent[0] = abs(percent_all[0] - 0.1)
    percent[1] = abs(percent_all[1] - 0.2)
    percent[2] = abs(percent_all[2] - 0.3)
    percent[3] = abs(percent_all[3] - 0.4)
    diff = sum(percent) / 4
    return diff


def main():
    diff_short = []
    diff_long = []
    length_short = [100, 200, 500, 1000]
    length_long = [5000, 10000, 50000, 100000]
    i = j = 0
    for total in range(100, 1000, 100):
        diff_short[i] = k_test(create(total))
        i += 1
    for total in range(2000, 11000, 1000):
        diff_long[j] = k_test(create(total))
        j += 1
    print(diff_short)
    print(diff_long)

main()
