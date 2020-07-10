#=
Problem 19: How many Sundays fell on the first of the month during the
            twentieth century?
=#


using Dates


function find()
    total = 0
    for i=1901:2000
        for j=1:12
            d = Date(i, j, 1)
            if dayname(d) == "Sunday"
                total += 1
            end
        end
    end
    total
end


println("Answer: ", find())
@benchmark find()
#=
BenchmarkTools.Trial: 
  memory estimate:  0 bytes
  allocs estimate:  0
  --------------
  minimum time:     34.540 μs (0.00% GC)
  median time:      35.023 μs (0.00% GC)
  mean time:        35.082 μs (0.00% GC)
  maximum time:     48.325 μs (0.00% GC)
  --------------
  samples:          10000
  evals/sample:     1
=#
