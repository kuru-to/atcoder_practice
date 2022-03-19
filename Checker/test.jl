using Test

include("main.jl")

needs_black, needs_white = reduce_K_square(3, [Point(0, 1), Point(5, 2), Point(5, 4)], ["W", "B", "B"])
@test Matrix(needs_black) == [0 0 0; 0 0 0; 0 1 0]
@test Matrix(needs_white) == [0 1 0; 0 0 0; 0 0 1]

@test run(4, 3, [Point(0, 1), Point(1, 2), Point(5, 3), Point(5, 4)], ["W", "W", "B", "B"]) == 4
@test run(2, 1000, [Point(0, 0), Point(0, 1)], ["B", "W"]) == 2
@test run(
    6, 2,
    [Point(1, 2), Point(2, 1), Point(2, 2), Point(1, 0), Point(0, 6), Point(4, 5)],
    ["B", "W", "B", "B", "W", "W"]
) == 4
