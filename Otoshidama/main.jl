function run(N::Int, Y::Int)::Tuple{Int, Int, Int}
    for x in reverse(0:N)
        Y_x = Y - 10000 * x
        if Y_x < 0
            continue
        end
        for y in reverse(0:(N-x))
            z = N - x - y
            if Y_x == 5000 * y + 1000 * z
                return (x, y, z)
            end
        end
    end
    return (-1, -1, -1)
end

function main()
    parseInt(str=readline()) = parse.(Int, split(str))
    N_Y = parseInt()
    output = run(N_Y[1], N_Y[2])
    println(join(output, " "))
end


if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
