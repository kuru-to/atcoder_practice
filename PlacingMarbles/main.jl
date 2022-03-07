export count_one

function count_one(input::String)::Int
    count = 0
    for i = input
        if i == '1'
            count = count + 1
        end
    end
    return count
end

function main()
    input = readline()
    println(count_one(input))
end


if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
