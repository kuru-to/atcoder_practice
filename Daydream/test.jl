using Test

include("main.jl")
@test run("erasedream")
@test run("dreameraser")
@test ~run("dreamerer")
