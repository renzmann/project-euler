#= Problem 6: Find the difference between the sum of the squares of the first
              one hundred natural numbers and the square of the sum
=#

using BenchmarkTools
using Formatting

function sumsquares(last)
    squarestotal = 0
    sumtotal = 0

    for i=1:last
        squarestotal += i^2
        sumtotal += i
    end

    sumtotal^2 - squarestotal
end


println("Answer:", format(sumsquares(100), commas=true))
@benchmark sumsquares(100)
# Answer:25164150
# BenchmarkTools.Trial: 
#   memory estimate:  0 bytes
#   allocs estimate:  0
#   --------------
#   minimum time:     1.129 ns (0.00% GC)
#   median time:      1.134 ns (0.00% GC)
#   mean time:        1.151 ns (0.00% GC)
#   maximum time:     17.306 ns (0.00% GC)
#   --------------
#   samples:          10000
#   evals/sample:     1000
