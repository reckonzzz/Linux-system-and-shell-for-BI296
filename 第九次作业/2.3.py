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

    print("total: %5d  A: %4d  G: %4d  C: %4d  T: %4d" % (total, a_times, g_times, c_times, t_times))
    print("%0.3f %0.3f %0.3f %0.3f" % (a_times/total, g_times/total, c_times/total, t_times/total))
    return result


def main():
    length = [100, 200, 500, 1000, 5000, 10000, 50000, 100000]
    for total in range(0, 2100, 100):
        if total > 0:
            #print(create(total))
            create(total)


main()
