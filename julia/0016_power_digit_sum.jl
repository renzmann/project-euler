#=
Problem 16: What is the sum of the digits of the number 2^1000?
=#


using BenchmarkTools
using Formatting


function find()
    num = 1.0
    for i=1:1000
        num *= 2
        println(num)
        if num > 10
            num /= 10
        end
    end
    string(num)
    # stringnum = replace(string(num), "." => "")

    # total = 0
    # for a ∈ stringnum
        # total += parse(Int, a)
    # end
    # total
end


println("Answer: ", format(find(), commas=true))
@benchmark find()
