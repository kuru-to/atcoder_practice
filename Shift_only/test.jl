using Test
include("main.jl")

@test shift_only([8, 12, 40]) == 2
@test shift_only([5, 6, 8, 10]) == 0
@test shift_only([382253568, 723152896, 37802240, 379425024, 404894720, 471526144]) == 8
