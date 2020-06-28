#= Problem 5: What is the smallest positive number that is evenly divisible by
              all of the numbers from 1 to 20?

 This one is trivially solved on paper. For each of 1 - 20, look at the prime
 factorization, and for each prime between 2 and 20, take each one to the maximum
 power seen in the above list. The answer is the product of these.
=#

try
    using Formatting
catch
    import Pkg; Pkg.add("Formatting")
    using Formatting
finally
    using Formatting
end

ans = 2^4 * 3^2 * 5 * 7 * 11 * 13 * 17 * 19
println("Answer:", format(ans, commas=true))

