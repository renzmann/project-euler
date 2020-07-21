def solve(upper):
    primes = [True] * (upper + 1)
    primes[0] = primes[1] = False

    for x in range(2, upper):
        if primes[x]:
            for y in range(2 * x, upper, x):
                primes[y] = False

    primeSet = {i for i, x in enumerate(primes) if x}
    result, maxLen = -1, -1

    for prime in primeSet:
        res, m, seen, _len = 10, 0, {}, 0
        while True:
            if res == 0:
                break
            elif res in seen:
                _len = m - seen[res]
                break
            seen[res] = m
            res, m = 10 * (res % prime), m + 1
        if _len > maxLen: maxLen, result = _len, prime

    return result


def multiplicative_order(n, d):
    k = 1
    while (n**k % d) != 1:
        k += 1
    return k


def find(n):
    longest_d = 0
    longest_length = 0

    for d in range(3, n, 2):
        if (d % 5) == 0:
            continue
        period = multiplicative_order(10, d)

        if period > longest_length:
            longest_d = d
            longest_length = period

    return longest_d, longest_length


print("Answer: d={}, length={}".format(**solve(1000)))
# TODO test the `find` method... faster than Julia?
