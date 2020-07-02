#=
A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
a2 + b2 = c2

For example, 32 + 42 = 9 + 16 = 25 = 52.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
=#

using BenchmarkTools
using Formatting


function iseven(x)
    not Bool(x % 2)
end


function generatetriple(m, n)
    a = m * n
    b = (m^2 - n^2) / 2
    c = (m^2 + n^2) / 2

    if iseven(a)
        a, b = b, a
    end

    return Int(a), Int(b), Int(c)
end


function find()
    m = 5
    n = 3

    for m=5:2:999
        for n=3:2:m-2
            a, b, c = generatetriple(m, n)
            if a + b + c == 1000
                return a * b * c
            end
        end
    end
    
    println("Nothing found.")        

end


println("Answer: ", format(find(), commas=true))
@benchmark find()
#=
BenchmarkTools.Trial: 
  memory estimate:  0 bytes
  allocs estimate:  0
  --------------
  minimum time:     420.568 ns (0.00% GC)
  median time:      432.349 ns (0.00% GC)
  mean time:        433.855 ns (0.00% GC)
  maximum time:     896.151 ns (0.00% GC)
  --------------
  samples:          10000
  evals/sample:     199
=#
