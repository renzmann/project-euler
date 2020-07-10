#=
Problem 14: Which starting number under one million produces the 
            longest Collatz sequence?
=#


using BenchmarkTools
using Formatting


function collatz(n, iterseq)
    if n == 1
        return iterseq
    else
        push!(iterseq, n)
    end
    if iseven(n)
        return collatz(n ÷ 2, iterseq)
    else
        return collatz(3*n + 1, iterseq)
    end
end


function collatz(n)
    collatz(n, [])
end


function find()
    start = 0
    longest = 0

    for i=1:(10^6-1)
        thislength = length(collatz(i))
        if thislength > longest
            start = i
            longest = thislength
        end
    end
    start
end


println("Answer: ", format(find(), commas=true))
@benchmark find()
#=
BenchmarkTools.Trial: 
  memory estimate:  4.38 GiB
  allocs estimate:  98561823
  --------------
  minimum time:     2.258 s (4.27% GC)
  median time:      2.286 s (4.35% GC)
  mean time:        2.283 s (4.31% GC)
  maximum time:     2.305 s (4.31% GC)
  --------------
  samples:          3
  evals/sample:     1
=#
