#= 
A perfect number is a number for which the sum of its proper
divisors is exactly equal to the number. For example, the sum of the
proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means
that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is
less than n and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the
smallest number that can be written as the sum of two abundant numbers
is 24. By mathematical analysis, it can be shown that all integers
greater than 28123 can be written as the sum of two abundant
numbers. However, this upper limit cannot be reduced any further by
analysis even though it is known that the greatest number that cannot
be expressed as the sum of two abundant numbers is less than this
limit.

Find the sum of all the positive integers which cannot be written as
the sum of two abundant numbers.

Note: Let's call all numbers that can't be written as the sum of two
      abundant numbers "dry".
=#


using BenchmarkTools
using Formatting


"When checking for prime-ness, we only need to iterate up to √x"
function maxfactor(x)
    Int(ceil(√(x)))
end


function sumOfDivisors(n)
    prod = 1

    for k=2:maxfactor(n)
        p = 1
        while mod(n, k) == 0
            p = p * k + 1
            n /= k
        end
        prod *= p
    end
    
    if n > 1
        prod *= 1 + n
    end

    prod
end


function find()
    upper_limit = 28123

    abundant = []
    for i=2:upper_limit
        if sumOfDivisors(i) > 2 * i
            push!(abundant, i)
        end
    end

    sumOfAbundants = falses(2 * upper_limit + 1)
    for i=1:length(abundant)
        for j=1:i
            sumOfAbundants[abundant[i] + abundant[j]] = true
        end
    end

    total = 0
    for i=1:upper_limit
        if !sumOfAbundants[i]
            total += i
        end
    end
    
    total
end


println("Answer: ", format(find(), commas=true))
@benchmark find()
#=
BenchmarkTools.Trial: 
  memory estimate:  370.35 MiB
  allocs estimate:  24262396
  --------------
  minimum time:     423.383 ms (1.41% GC)
  median time:      425.541 ms (1.45% GC)
  mean time:        426.225 ms (1.46% GC)
  maximum time:     436.275 ms (1.41% GC)
  --------------
  samples:          12
  evals/sample:     1
=#
