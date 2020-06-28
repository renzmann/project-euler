# Problem 6: Find the difference between the sum of the squares of the first
#            one hundred natural numbers and the square of the sum

import numpy as np

def sum_squares(nats):
    return np.sum(nats)**2 - np.sum(nats**2)

# %timeit sum_squares(np.arrange(1, 101))
# 5.81 µs ± 21.6 ns per loop (mean ± std. dev. of 7 runs, 100000 loops each)
