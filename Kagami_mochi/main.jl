function run(N::Int, d::Array{Int})::Int
    set_d = Set(d)
    return length(set_d)
end

function main()
    parseInt(str=readline()) = parse(Int, str)
    N = parseInt()
    d = zeros(Int, N)
    for i in 1:N
        d[i] = parseInt()
    end
    output = run(N, d)
    println(output)
end


if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
