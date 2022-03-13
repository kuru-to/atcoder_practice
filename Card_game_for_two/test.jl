using Test

include("main.jl")
@test card_game_for_two(2, [3, 1]) == 2
@test card_game_for_two(3, [2, 7, 4]) == 5
@test card_game_for_two(4, [20, 18, 2, 18]) == 18
