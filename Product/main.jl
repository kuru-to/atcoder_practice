export is_even

function is_even(a::Int, b::Int)::Bool
    if a % 2 == 0 || b % 2 == 0
        return true
    else return false
    end
end

function main()
    input = parse.(Int, split(readline()))
    if is_even(input[1], input[2]) println("Even")
    else println("Odd")
    end
end


if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
