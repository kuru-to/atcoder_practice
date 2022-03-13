using Test

include("main.jl")
@test run(4, [10, 8, 8, 6]) == 3
@test run(3, [15, 15, 15]) == 1
@test run(7, parse.(Int, split("50 30 50 100 50 80 30", " "))) == 4
