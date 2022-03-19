using Test

include("main.jl")
@test run(2, [3 5 2], [4 5]) == 9
@test run(3, [5 6 3 8], [5 100 8]) == 22
@test run(2, [100 1 1], [1 100]) == 3
