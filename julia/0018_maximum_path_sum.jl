#=
Problem 18:

By starting at the top of the triangle below and moving to adjacent
numbers on the row below, the maximum total from top to bottom is 23.

3
7 4
2 4 6
8 5 9 3

That is, 3 + 7 + 4 + 9 = 23.


Find the maximum total from top to bottom of the triangle below

75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
=#


using BenchmarkTools
using Formatting
using LinearAlgebra


function triangle()
[
    [75],
    [95, 64],
    [17, 47, 82],
    [18, 35, 87, 10],
    [20, 04, 82, 47, 65],
    [19, 01, 23, 75, 03, 34],
    [88, 02, 77, 73, 07, 63, 67],
    [99, 65, 04, 28, 06, 16, 70, 92],
    [41, 41, 26, 56, 83, 40, 80, 70, 33],
    [41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
    [53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
    [70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
    [91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48],
    [63, 66, 04, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31],
    [04, 62, 98, 27, 23, 09, 70, 98, 73, 93, 38, 53, 60, 04, 23]
]
end


function find()
    Δ = triangle()
    maxtots = [[75]]
    for i=2:length(Δ)
        lastrow = maxtots[i - 1]
        comparerow = vcat([lastrow[1]], lastrow, [lastrow[end]])
        maxelements = [max(comparerow[j], comparerow[j + 1]) for j=1:length(Δ[i])]
        maxdist = Δ[i] .+ maxelements
        push!(maxtots, maxdist)
    end
    maximum(maxtots[end])
end


println("Answer: ", format(find(), commas=true))
@benchmark(find())
#=
BenchmarkTools.Trial: 
  memory estimate:  12.58 KiB
  allocs estimate:  120
  --------------
  minimum time:     2.350 μs (0.00% GC)
  median time:      2.541 μs (0.00% GC)
  mean time:        3.101 μs (14.79% GC)
  maximum time:     220.944 μs (98.12% GC)
  --------------
  samples:          10000
  evals/sample:     9
=#
