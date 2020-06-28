# Problem 2: Find the sum of the even valued fibonacci numbers below four million


def sum_even_fib(last_iter, this_iter, total, terminate=4*10**6):
    if this_iter >= terminate:
        return total
    elif this_iter % 2:
        return sum_even_fib(this_iter, last_iter + this_iter, total, terminate)
    else:
        return sum_even_fib(this_iter, last_iter + this_iter, total + this_iter, terminate)


print("Answer:", sum_even_fib(1, 1, 0))
# %timeit sum_even_fib(1, 1, 0)
# 3.61 µs ± 28.9 ns per loop (mean ± std. dev. of 7 runs, 100000 loops each)
