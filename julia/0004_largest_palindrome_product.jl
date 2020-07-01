# What is the largest palindrome that is the product of two three-digit numbers?

using BenchmarkTools
using Formatting


function isPalindrome(n)
    numString = string(n)
    numString == reverse(numString)
end


function findLargestPalindrome()

    largestPalindrome = 0
    a = 999

    while a >= 100
        b = 999
        while b >= a
            product = a * b
            if product <= largestPalindrome
                break
            elseif isPalindrome(product)
                largestPalindrome = product
            end
            b -= 1
        end
        a -= 1
    end

    largestPalindrome
end

println("Answer: ", format(findLargestPalindrome(), commas=true))
@benchmark findLargestPalindrome()
# Answer:906609
# BenchmarkTools.Trial: 
#   memory estimate:  403.13 KiB
#   allocs estimate:  9675
#   --------------
#   minimum time:     167.059 μs (0.00% GC)
#   median time:      169.959 μs (0.00% GC)
#   mean time:        180.929 μs (3.29% GC)
#   maximum time:     1.091 ms (74.42% GC)
#   --------------
#   samples:          10000
#   evals/sample:     1
