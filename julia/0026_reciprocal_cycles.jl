#=
Problem 26: Find the value of d < 1000 for which 1/d contains the longest
            recurring cycle in its decimal fraction part.

ANS: This one has more pen-and-paper component to it than straightforward
     implementation. First, notice that we're not concerned with values of d
     that contain 2 or 5 as a factor, since these give us a terminating
     expansion plus a shifted repeating expansion. Additionally, for values of
     d ending in 1, 3, 7, or 9, repetition begins directly after the decimal
     point. So by setting k to be the period, we have
                    (10ᵏ - 1) / d = x₁x₂…xₖ
     if and only if d | (10ᵏ - 1). So what we are after is in fact the
     multiplicative order of 10 modulo d. The implementation below will
     calculate this order for all good candidates of d, and select the largest
     value.
=#

using BenchmarkTools


function multiplicative_order(n, d)
    k = BigInt(1)
    while mod(n^k, d) != 1
        k += 1
    end
    k
end


function find(upper)
    longest_d = 0
    longest_length = 0
    for d=3:2:upper
        if d % 5 == 0
            continue
        end
        period = multiplicative_order(10, d)
        if  period > longest_length
            longest_d = d
            longest_length = period
        end
    end
    longest_d, longest_length
end

longest_d, longest_length = find(1000)
println("Answer: d=", longest_d, ", length=", longest_length)
@benchmark find(1000)
#=
BenchmarkTools.Trial: 
  memory estimate:  32.10 MiB
  allocs estimate:  1761097
  --------------
  minimum time:     74.903 ms (0.00% GC)
  median time:      135.827 ms (23.11% GC)
  mean time:        124.873 ms (21.94% GC)
  maximum time:     224.469 ms (51.76% GC)
  --------------
  samples:          41
  evals/sample:     1
=#
