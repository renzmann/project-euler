# What is the largest prime factor of 600851475143?

using BenchmarkTools

thenumber = 600851475143

function firstDivisor(m::Int, iter::Int)
    if (m % iter == 0)
        return iter
    end
    firstDivisor(m, iter + 1)
end


function findLargestPrimeFactor(n::Int)
    firstFactor = firstDivisor(n, 2)
    if firstFactor == n
        return n
    end
    findLargestPrimeFactor(Int(n / firstFactor))
end

println("Answer:", findLargestPrimeFactor(thenumber))
@benchmark findLargestPrimeFactor(thenumber)
# Answer:6857
# BenchmarkTools.Trial: 
#   memory estimate:  0 bytes
#   allocs estimate:  0
#   --------------
#   minimum time:     32.386 μs (0.00% GC)
#   median time:      32.412 μs (0.00% GC)
#   mean time:        32.642 μs (0.00% GC)
#   maximum time:     148.099 μs (0.00% GC)
#   --------------
#   samples:          10000
#   evals/sample:     1

