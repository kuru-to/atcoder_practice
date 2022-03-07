using Test
include("main.jl")

@test count_one("101") == 2
@test count_one("000") == 0
