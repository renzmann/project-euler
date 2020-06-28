#= Problem 7: What is the 10,001st prime number?

   This problem can be solved in two steps. First, we take an
   approximation of π(x), the prime-counting function, to get some
   idea of the upper bound in the natural numbers for which we have
   10,001 primes. Second, use the Sieve of Eratosthenes to find the
   10,001st prime exactly.

=#

using BenchmarkTools

"""
Approximate the number of primes below `n`. This method tends to
over-estimate, which is a property we will exploit to ensure we
initialize enough space for the sieving array.
"""
function π(n)
    n / log(n)
end


"Perform sieve of Eratosthenes to find 10,001st prime"
function sieve(N)

    A = trues(N-1)

    for i=2:trunc(Int, √N)
        if A[i - 1]  # our index is off by 1, since we start @ 2
            j = i^2
            while j <= N
                A[j-1] = false
                j += i
            end
        end
    end

    primes = [2:N;][A]

end


"Get the 10,001st prime"
function findprime()

    N = 10^5
    while π(N) < 10001
        N += 100
    end
    primes = sieve(N)
    primes[10^4 + 1]
end


println("Answer: ", findprime())
@benchmark findprime()
# Answer: 104743
# BenchmarkTools.Trial: 
#   memory estimate:  1012.48 KiB
#   allocs estimate:  8
#   --------------
#   minimum time:     464.413 μs (0.00% GC)
#   median time:      479.452 μs (0.00% GC)
#   mean time:        494.654 μs (2.51% GC)
#   maximum time:     1.308 ms (43.66% GC)
#   --------------
#   samples:          10000
#   evals/sample:     1
