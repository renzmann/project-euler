# Problem 21: Evaluate the sum of all the amicable numbers under 10,000


using BenchmarkTools
using Formatting


UPPERBOUND = 10^4


function d(n)
    total = 0
    for i=1:n÷2
        if total == 1 && i > √n
            break  # This means we're a prime number
        end
        if n % i == 0
            total += i
        end
    end
    total
end


function amicable(n)
    x = d(n)
    d(x) == n && x != n
end


function find(n)
    total = 0
    for i=2:n
        if amicable(i)
            total += i
        end
    end
    total
end


println("Answer: ", format(find(UPPERBOUND - 1), commas=true))
@benchmark find(UPPERBOUND - 1)
#=
BenchmarkTools.Trial: 
  memory estimate:  32 bytes
  allocs estimate:  2
  --------------
  minimum time:     126.950 ms (0.00% GC)
  median time:      127.429 ms (0.00% GC)
  mean time:        127.457 ms (0.00% GC)
  maximum time:     129.465 ms (0.00% GC)
  --------------
  samples:          40
  evals/sample:     1
=#
