
#=
Find the sum of all the primes below two million
=#

using BenchmarkTools
using Formatting


"Sieve of Eratosthenes"
function sieve(N)

    A = trues(N-1)

    for i=2:trunc(Int, √N)
        if A[i - 1]  # our index is off by 1, since we start @ 2
            j = i^2
            while j <= N
                A[j-1] = false
                j += i
            end
        end
    end

    primes = [2:N;][A]

end


function find()
    sum(sieve(2*10^6))
end


println("Answer: ", format(find(), commas=true))
@benchmark find()
#=
BenchmarkTools.Trial: 
  memory estimate:  16.63 MiB
  allocs estimate:  9
  --------------
  minimum time:     7.367 ms (0.00% GC)
  median time:      8.901 ms (0.00% GC)
  mean time:        9.256 ms (5.36% GC)
  maximum time:     63.514 ms (83.79% GC)
  --------------
  samples:          540
  evals/sample:     1
=#
