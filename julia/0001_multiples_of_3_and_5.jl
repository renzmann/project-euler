# Problem 1: Find the sum of all the multiples of 3 or 5 below 1000

using BenchmarkTools


function calctotal()

    total = 0

    for i=1:999
        if (i % 3 == 0) || (i % 5 == 0)
            total += i
        end
    end

    total
end


println("Answer:", calctotal())
@benchmark calctotal()
# Answer:233168
# BenchmarkTools.Trial: 
#   memory estimate:  0 bytes
#   allocs estimate:  0
#   --------------
#   minimum time:     1.412 μs (0.00% GC)
#   median time:      1.421 μs (0.00% GC)
#   mean time:        1.437 μs (0.00% GC)
#   maximum time:     12.884 μs (0.00% GC)
#   --------------
#   samples:          10000
#   evals/sample:     10
