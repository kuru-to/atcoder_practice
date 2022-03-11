export shift_only

function coins(A::Int, B::Int, C::Int, X::Int)::Int
    count = 0

    for i in 0:A
        for j in 0:B
            for k in 0:C
                sum_ = 500*i + 100*j + 50*k
                if sum_ == X
                    count += 1
                end
            end
        end
    end

    return count
end

function main()
    parseInt(str=readline()) = parse(Int, str)
    A = parseInt()
    B = parseInt()
    C = parseInt()
    X = parseInt()
    output = coins(A, B, C, X)
    println(output)
end


if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
