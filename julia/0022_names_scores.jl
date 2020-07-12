#= 
Problem 22: Using names.txt (right click and 'Save Link/Target
            As...'), a 46K text file containing over five-thousand first names,
            begin by sorting it into alphabetical order. Then working out the
            alphabetical value for each name, multiply this value by its
            alphabetical position in the list to obtain a name score.
=#

using Formatting
using DelimitedFiles
using BenchmarkTools


function score(a::Char)
    Int(a) - 64  # 'A' is encoded as 65
end


function score(name::String)
    sum(score(a) for a in name)
end


function find()
    names = readdlm("../p022_names.txt", ',', String)
    sort!(names; dims=2)
    sum(i * score(name) for (i, name) in enumerate(names))
end


println("Answer: ", format(find(), commas=true))
@benchmark find()
#=
BenchmarkTools.Trial: 
  memory estimate:  818.17 KiB
  allocs estimate:  20086
  --------------
  minimum time:     1.480 ms (0.00% GC)
  median time:      1.489 ms (0.00% GC)
  mean time:        1.528 ms (1.89% GC)
  maximum time:     3.635 ms (52.37% GC)
  --------------
  samples:          3267
  evals/sample:     1
=#
