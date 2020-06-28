# Project Euler Solutions
This is a personal project repository, where I'm storing my solutions
to project euler. I'm also interested in benchmarking Julia against
Python + NumPy where I can, as a way to learn how to solve some common
problems with Julia. In Julia benchmarking is done via the
`@benchmark` macro from `BenchmarkTools` in the Julia REPL by using
`include(<filename>)` for each of the problems. For python, we take a
similar approach, since the filenames begin with integers, we open an
IPython shell and use `lib = __import__(<filename>)`, then call
`%timeit lib.<function_name>(args)`.
