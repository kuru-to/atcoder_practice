using Test

include("main.jl")
@test run(3, [Point(0, 1), Point(1, 2), Point(5, 3), Point(5, 4)], ["W", "W", "B", "B"]) == 4
@test run(1000, [Point(0, 0), Point(0, 1)], ["B", "W"]) == 2
@test run(
    2,
    [Point(1, 2), Point(2, 1), Point(2, 2), Point(1, 0), Point(0, 6), Point(4, 5)],
    ["B", "W", "B", "B", "W", "W"]
) == 4
