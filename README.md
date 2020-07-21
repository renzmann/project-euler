# Project Euler Solutions
This is a personal project repository, where I'm storing my solutions
to the first one hundred project Euler problems (which are not governed by
the secrecy requirement) as an educational repository. If you have not solved
these problems on your own, I strongly recommend **against** reading solutions
here until you have discovered the solutions for yourself.

One important part of this repository are the benchmark measurements of
Julia against Python + NumPy. In Julia, benchmarking is done via the
`@benchmark` macro from `BenchmarkTools` in the Julia REPL by using
`include(<filename>)` for each of the problems. For python, we take a
similar approach, since the filenames begin with integers, we open an
IPython shell and use `lib = __import__(<filename>)`, then call
`%timeit lib.<function_name>(args)`.

If you wish to run these examples on your own machine, you will need
only a copy of python 3.6+ with NumPy 1.8+, and Julia 1.4+. For
reference, I am running these on Ubuntu 18.04 with an Intel(R)
Core(TM) i7-7820X CPU @ 3.60GHz. All benchmarking times listed in the
source code are relative to my personal desktop runtime.
