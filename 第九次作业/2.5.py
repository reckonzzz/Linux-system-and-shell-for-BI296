def reverse_search(dic, point):
    res = []
    for key, var in dic.items():
        if var == point:
            res.append(key)
    return "{0}: {1}".format(point, res)


dic = {'a': 1, 'b': 2, 'c': 1, 'd': 3, 'e': 2, 'f': 1, 'g': 4}
for i in range(1, 5):
    print(reverse_search(dic, i))

