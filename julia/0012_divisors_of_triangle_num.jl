#= Problem 12: What is first triangle number to have over 500 divisors?

To solve this, we use a trick relating to the exponents of the prime
factors of a number. For each prime factor p that divides n, let k be
the maximum exponent of p that still divides n. That is, pᵏ | n, but
p⁽ᵏ⁺¹⁾ does not divide n. Then to get the number of divisors of n,
we just take the product of each (kₚ + 1), by the multiplicative
law of combinatorics.

=#

using BenchmarkTools
using Formatting


"""
The maximum that any factor of a number can be is its square root.
We define this guy to simplify our for loops when checking for
factors
"""
function maxfactor(x)
    Int(ceil(√(x)))
end


"Shouldn't need an explanation for this one."
function isprime(x)
    if x == 2
        return true
    end
    
    for i=2:maxfactor(x)
        if x % i == 0
            return false
        end
    end
    true
end
1

"Recursively find the number of times i divides into m"
function getexponent(i, m, acc)
    if (m % i != 0)
        return acc
    end
    getexponent(i, m ÷ i, acc + 1)
end


"For each prime factor of n, get the number of times it divides into n, plus one"
function findexponents(n)
    exponents = []

    for i=2:maxfactor(n)
        if (n % i == 0) && isprime(i)
            thisexponent = getexponent(i, n, 0)
            push!(exponents, thisexponent + 1)
        end
    end
    exponents
end


"Find the number of divisors of n"
function numdivisors(n)
    exponents = findexponents(n)

    if isempty(exponents)
        return 0
    end
    
    prod(findexponents(n))
end


function find()
    i = 1
    j = 2
    while (numdivisors(i) <= 500)
        i += j
        j += 1
    end
    i
end


println("Answer: ", format(find(), commas=true))
@benchmark find()
#=
BenchmarkTools.Trial: 
  memory estimate:  3.84 MiB
  allocs estimate:  60279
  --------------
  minimum time:     264.884 ms (0.00% GC)
  median time:      265.889 ms (0.00% GC)
  mean time:        266.062 ms (0.03% GC)
  maximum time:     268.472 ms (0.58% GC)
  --------------
  samples:          19
  evals/sample:     1
=#
