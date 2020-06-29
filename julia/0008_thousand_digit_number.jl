#= Problem 8: Find the thirteen adjacent digits in this 1000-digit
              number that have the greatest product. What is the value
              of this product?

   Optimization hint: this could go much faster if we first locate the
   zeros and only look between them.
=#


using BenchmarkTools
using Formatting


function windowcalc(digitarr, windowsize=13)

    maxprod = 0

    for i=1:(length(digitarr) - windowsize + 1)
        runningprod = prod(digitarr[i:(i + windowsize - 1)])
        if runningprod > maxprod
            maxprod = runningprod
        end
    end
    maxprod
end


function findvalue()

    rawdigits = """
73167176531330624919225119674426574742355349194934
96983520312774506326239578318016984801869478851843
85861560789112949495459501737958331952853208805511
12540698747158523863050715693290963295227443043557
66896648950445244523161731856403098711121722383113
62229893423380308135336276614282806444486645238749
30358907296290491560440772390713810515859307960866
70172427121883998797908792274921901699720888093776
65727333001053367881220235421809751254540594752243
52584907711670556013604839586446706324415722155397
53697817977846174064955149290862569321978468622482
83972241375657056057490261407972968652414535100474
82166370484403199890008895243450658541227588666881
16427171479924442928230863465674813919123162824586
17866458359124566529476545682848912883142607690042
24219022671055626321111109370544217506941658960408
07198403850962455444362981230987879927244284909188
84580156166097919133875499200524063689912560717606
05886116467109405077541002256983155200055935729725
71636269561882670428252483600823257530420752963450
"""

    digs = [parse(Int, c) for c ∈ rawdigits if c != '\n']
    maxproduct = windowcalc(digs)
end

println("Answer: ", format(findvalue(), commas=true))
@benchmark findvalue()
# BenchmarkTools.Trial: 
#   memory estimate:  201.75 KiB
#   allocs estimate:  1001
#   --------------
#   minimum time:     47.770 μs (0.00% GC)
#   median time:      53.636 μs (0.00% GC)
#   mean time:        56.877 μs (3.17% GC)
#   maximum time:     672.148 μs (87.77% GC)
#   --------------
#   samples:          10000
#   evals/sample:     1
