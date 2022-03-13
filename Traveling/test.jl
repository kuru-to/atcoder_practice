using Test

include("main.jl")
@test run(2, [3, 6], [1 2; 1 1])
@test ~run(1, [2], [100 100])
@test ~run(2, [5, 100], [1 1; 1 1])
@test run(3, [3, 6, 7], [1 2; 1 1; 2 1])
