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
# @benchmark find()
