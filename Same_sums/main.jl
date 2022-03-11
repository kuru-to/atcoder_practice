export shift_only

function same_sums(N::Int, A::Int, B::Int)::Int
    sum_ = 0
    # 整数AからNまでで確認
    for i in A:N
        n = 0
        i_str = string(i)
        for j in 1:length(i_str)
            n += parse(Int, i_str[j])
        end
        if A <= n <= B
            sum_ += i
        end
    end
    return sum_
end

function main()
    parseInt(str=readline()) = parse.(Int, split(str))
    N_A_B = parseInt()
    output = same_sums(N_A_B[1], N_A_B[2], N_A_B[3])
    println(output)
end


if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
