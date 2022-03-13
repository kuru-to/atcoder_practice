using Test

include("main.jl")
@test run(9, 45000) == (4, 0, 5)
@test run(20, 196000) == (-1, -1, -1)
@test run(2000, 20000000) == (2000, 0, 0)
