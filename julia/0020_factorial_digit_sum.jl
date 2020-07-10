#=
Problem 20: Find the sum of the digits in the number 100!
=#


using BenchmarkTools
using Formatting


function find()
    total = BigInt(1)
    for i=2:100
        total *= i
    end
    numstring = string(total)
    sum([parse(Int, a) for a ∈ numstring])
end


println("Answer: ", format(find(), commas=true))
@benchmark find()
#=
BenchmarkTools.Trial: 
  memory estimate:  8.79 KiB
  allocs estimate:  308
  --------------
  minimum time:     8.193 μs (0.00% GC)
  median time:      9.824 μs (0.00% GC)
  mean time:        19.022 μs (28.90% GC)
  maximum time:     22.922 ms (79.10% GC)
  --------------
  samples:          10000
  evals/sample:     4
=#
