using Test
include("main.jl")

@test coins(2, 2, 2, 100) == 2
@test coins(5, 1, 0, 150) == 0
@test coins(30, 40, 50, 6000) == 213
