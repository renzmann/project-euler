#=
Problem 24: What is the millionth lexicographic permutation of the digits
            0, 1, 2, 3, 4, 5, 6, 7, 8, and 9?

Ans: Got lazy with this one. Stole the "permutation" iterator construction
     from "Combinatorics.jl" at https://github.com/JuliaMath/Combinatorics.jl
=#


using BenchmarkTools


struct Permutations{T}
    a::T
    t::Int
end


permutations(a) = Permutations(a, length(a))


function permutations(a, t::Integer)
    if t < 0
        t = length(a) + 1
    end
    Permutations(a, t)
end


function Base.iterate(p::Permutations, s = collect(1:length(p.a)))
    (!isempty(s) && max(s[1], p.t) > length(p.a) || (isempty(s) && p.t > 0)) && return
    nextpermutation(p.a, p.t, s)
end


function nextpermutation(m, t, state)
    perm = [m[state[i]] for i in 1:t]
    n = length(state)
    if t <= 0
        return(perm, [n+1])
    end
    s = copy(state)
    if t < n
        j = t + 1
        while j <= n && s[t] >= s[j]
            j+=1
        end
    end
    if t < n && j <= n
        s[t], s[j] = s[j], s[t]
    else
        if t < n
            reverse!(s, t+1)
        end
        i = t - 1
        while i>=1 && s[i] >= s[i+1]
            i -= 1
        end
        if i > 0
            j = n
            while j>i && s[i] >= s[j]
                j -= 1
            end
            s[i], s[j] = s[j], s[i]
            reverse!(s, i+1)
        else
            s[1] = n+1
        end
    end
    return (perm, s)
end


function find()
    i = 0
    for perm ∈ permutations("0123456789")
        i += 1
        if i == 10^6
            return String(perm)
        end
    end
end


println("Answer: ", find())
@benchmark find()
