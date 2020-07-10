#=
Problem 16: What is the sum of the digits of the number 2^1000?
=#


using BenchmarkTools
using Formatting


function find()
    num = BigInt(1)
    for i=1:1000
        num *= 2
    end
    stringnum = string(num)
   
    total = 0
    for a ∈ stringnum
        total += parse(Int, a)
    end
    total
end


println("Answer: ", format(find(), commas=true))
@benchmark find()
#=
BenchmarkTools.Trial: 
  memory estimate:  104.49 KiB
  allocs estimate:  3004
  --------------
  minimum time:     56.857 μs (0.00% GC)
  median time:      84.450 μs (0.00% GC)
  mean time:        157.842 μs (24.10% GC)
  maximum time:     78.646 ms (80.96% GC)
  --------------
  samples:          10000
  evals/sample:     1
=#
