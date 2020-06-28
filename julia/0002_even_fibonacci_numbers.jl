# Problem 2: Find the sum of the even valued fibonacci numbers below four million

using BenchmarkTools

function sumEvenFibonacci(lastIter, thisIter, total, terminate=4*10^6)
    if thisIter >= terminate
        return total
    elseif Bool(thisIter % 2)  # This number is *not* divisible by 2
        return sumEvenFibonacci(thisIter, lastIter + thisIter, total, terminate)
    else  # This number *is* divisible by 2
        return sumEvenFibonacci(thisIter, lastIter + thisIter, total + thisIter,
                                terminate)
    end
end

println("Answer:", sumEvenFibonacci(1, 1, 0))
@benchmark sumEvenFibonacci(1, 1, 0)
# Answer:4613732
# BenchmarkTools.Trial: 
#   memory estimate:  0 bytes
#   allocs estimate:  0
#   --------------
#   minimum time:     77.632 ns (0.00% GC)
#   median time:      78.192 ns (0.00% GC)
#   mean time:        79.010 ns (0.00% GC)
#   maximum time:     226.260 ns (0.00% GC)
#   --------------
#   samples:          10000
#   evals/sample:     968

