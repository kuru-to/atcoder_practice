using Test
include("main.jl")
# using .A_Product

@test is_even(2, 3)
@test is_even(1, 2)
@test ~is_even(1, 3)
