using Test
include("main.jl")

@test same_sums(20, 2, 5) == 84
@test same_sums(10, 1, 2) == 13
@test same_sums(100, 4, 16) == 4554
