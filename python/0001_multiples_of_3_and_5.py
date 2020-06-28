# Problem 1: Find the sum of all multiples of 3 and 5 under 1000

import numpy as np


def calc_total(array):
    return np.sum(array)

integers = np.arange(1, 1001)
fizz_buzz_filter = ((integers % 3) == 0) | ((integers % 5) == 0)
to_sum = integers[fizz_buzz_filter]
print("Answer:", calc_total(to_sum))

# %timeit calc_total(to_sum)
# 2.44 µs ± 30.6 ns per loop (mean ± std. dev. of 7 runs, 100000 loops each)

