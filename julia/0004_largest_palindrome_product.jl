# What is the largest palindrome that is the product of two three-digit numbers?

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

println(findLargestPalindrome())
