export shift_only

function shift_only(lst::Array{Int}, n::Int=0)::Int
    for val in lst
        if val % 2 == 1
            return n
        end
    end
    return shift_only(Array{Int}(lst / 2), n+1)
end

function main()
    parseInt(str=readline()) = parse.(Int, split(str))
    N = parseInt()
    A = parseInt()
    output = shift_only(A)
    println(output)
end


if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
