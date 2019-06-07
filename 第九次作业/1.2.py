from math import *


def kl_divergence(a, b):
    sum1 = a[0] * log(a[0] / b[0], e)
    sum2 = a[1] * log(a[1] / b[1], e)
    return sum1 + sum2


a = (0.5, 0.5)
b = (0.25, 0.75)
print(kl_divergence(a, b))

