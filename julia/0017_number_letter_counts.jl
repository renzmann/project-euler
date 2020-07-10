#=
Problem 16: If all the numbers from 1 to 1000 inclusive were written out in
            words, how many letters would be used?

Note: This problem uses British numbering. So 342 is spelled "three hundred
      and forty-two".
=#


using BenchmarkTools
using Formatting


singledig = Dict(
    '0' => 0,  # Pass-through for cases like "20"
    '1' => 3,  # "one"
    '2' => 3,  # "two"
    '3' => 5,  # "three"
    '4' => 4,  # "four"
    '5' => 4,  # "five"
    '6' => 3,  # "six"
    '7' => 5,  # "seven"
    '8' => 5,  # "eight"
    '9' => 4   # "nine"
)


doubledig = Dict(
    "10" => 3, # "ten"
    "11" => 6, # "eleven"
    "12" => 6, # "twelve
    "13" => 8, # "thirteen"
    "14" => 8, # "fourteen
    "15" => 7, # "fifteen"
    "16" => 7, # "sixteen"
    "17" => 9, # "seventeen"
    "18" => 8, # "eighteen"
    "19" => 8  # "nineteen"
)


bigger = Dict(
    '0' => 0,  # Pass-through for cases like "101"
    '2' => 6,  # "twenty"
    '3' => 6,  # "thirty"
    '4' => 5,  # "forty"
    '5' => 5,  # "fifty"
    '6' => 5,  # "sixty"
    '7' => 7,  # "seventy"
    '8' => 6,  # "eighty"
    '9' => 6   # "ninety"
)


function countletters(a::Char)
    singledig[a]
end


function countletters(a::Char, b::Char)
    if a == '1'
        return doubledig[string(a, b)]
    end
    bigger[a] + singledig[b]
end


function countletters(a::Char, b::Char, c::Char)
    if b == '0' && c == '0'
        return singledig[a] + 7  # "hundred"
    end
    singledig[a] + countletters(b, c) + 10  # "hundred and"
end


function find()
    total = 0

    for i=1:999
        total += countletters(string(i)...)
    end
    total + 11 # "one thousand"
end


println("Answer: ", format(find(), commas=true))
@benchmark find()
#=
BenchmarkTools.Trial: 
  memory estimate:  201.69 KiB
  allocs estimate:  5923
  --------------
  minimum time:     267.015 μs (0.00% GC)
  median time:      270.845 μs (0.00% GC)
  mean time:        277.846 μs (1.74% GC)
  maximum time:     1.526 ms (79.93% GC)
  --------------
  samples:          10000
  evals/sample:     1
=#
