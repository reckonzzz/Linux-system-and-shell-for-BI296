class NumList:
    def __init__(self, num_list):
        self.num_list = num_list

    def __str__(self):
        return 'NumList({0})'.format(self.num_list)

    # 加法重载，且为正向加法
    def __add__(self, other):
        res = []
        if isinstance(other, int) or isinstance(other, float):
            res = [i + other for i in self.num_list]
            return NumList(res)
        if isinstance(other, NumList):
            if len(other.num_list) == len(self.num_list):
                for i in range(len(self.num_list)):
                    res.append(self.num_list[i] + other.num_list[i])
                return NumList(res)
            else:
                if len(other.num_list) < len(self.num_list):
                    short_list = other.num_list
                    long_list = self.num_list
                else:
                    short_list = self.num_list
                    long_list = other.num_list
                j = 0
                for i in range(len(long_list)):
                    if j == 2:
                        j = 0
                    res.append(long_list[i] + short_list[j])
                    j += 1
                return NumList(res)

    # 加法重载，但是为反向加法，面对数值在前的情况
    def __radd__(self, other):
        res = [i + other for i in self.num_list]
        return NumList(res)

    # 乘法重载，且为正向乘法
    def __mul__(self, other):
        res = []
        if isinstance(other, int) or isinstance(other, float):
            res = [i * other for i in self.num_list]
            return NumList(res)
        if isinstance(other, NumList):
            if len(other.num_list) == len(self.num_list):
                for i in range(len(self.num_list)):
                    res.append(self.num_list[i] * other.num_list[i])
                return NumList(res)
            else:
                if len(other.num_list) < len(self.num_list):
                    short_list = other.num_list
                    long_list = self.num_list
                else:
                    short_list = self.num_list
                    long_list = other.num_list
                j = 0
                for i in range(len(long_list)):
                    if j == 2:
                        j = 0
                    res.append(long_list[i] * short_list[j])
                    j += 1
                return NumList(res)

    # 乘法重载，但是为反向乘法，面对数值在前的情况
    def __rmul__(self, other):
        res = [i * other for i in self.num_list]
        return NumList(res)

    # 除法重载
    def __truediv__(self, other):
        if isinstance(other, int) or isinstance(other, float):
            res = [i / other for i in self.num_list]
            return NumList(res)


a = NumList([1, 2])
b = NumList([2, 3, 4, 5, 6])
print(a + 2.1)
print(2.1 + a)
print(a + b)
print(a * 3)
print(3 * a)
print(a * b)
print(a / 2)

