using Test

include("main.jl")

test_graph, test_S, test_T = run(2, 3, [1 2 2; 1 2 3])
@test test_graph == Graph(3, 4, [Edge(1, 2, 0, "X"), Edge(2, 3, 1), Edge(3, 2, 0, "Y"), Edge(1, 3, 0, "Y")])
@test test_S == 1
@test test_T == 3

@test isnothing(run(1, 3, [100 50 1]))
