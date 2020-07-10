#=
Problem 16: What is the sum of the digits of the number 2^1000?
=#


using BenchmarkTools
using Formatting


function find()
    num = BigInt(1)
    for i=1:1000
        num *= 2
    end
    stringnum = string(num)
   
    total = 0
    for a ∈ stringnum
        total += parse(Int, a)
    end
    total
end


println("Answer: ", format(find(), commas=true))
@benchmark find()
