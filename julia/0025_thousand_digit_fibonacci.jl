#=
Problem 25: What is the index of the first term in the Fibonacci sequence to
            contain 1,000 digits?
=#

using BenchmarkTools


function find()
    i = BigInt(1)
    j = BigInt(1)
    upper_limit = BigInt(10)
    upper_limit = upper_limit^999 - 1
    index = 2
    while j < upper_limit
        i, j = j, i + j
        index += 1
    end
    index
end


println("Answer: ", find())
@benchmark find()
#=
BenchmarkTools.Trial:
  memory estimate:  1.15 MiB
  allocs estimate:  9583
  --------------
  minimum time:     360.100 μs (0.00% GC)
  median time:      431.399 μs (0.00% GC)
  mean time:        1.163 ms (21.37% GC)
  maximum time:     118.472 ms (83.11% GC)
  --------------
  samples:          4290
  evals/sample:     1
=#
