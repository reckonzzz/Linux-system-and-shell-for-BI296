def sum_digit(num):
    return sum(int(i) for i in str(num) if i.isdigit())


def main():
    for num in range(100, 10000):
        temp = num
        while len(str(temp)) != 1:
            temp = sum_digit(temp)
        if temp == 7:
            print(num)


main()

