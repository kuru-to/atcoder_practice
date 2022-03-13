function card_game_for_two(N::Int, lst::Array{Int})::Int
    lst_sorted = sort(lst, rev=true)
    Alice_get = sum(lst_sorted[1:2:N])
    Bob_get = sum(lst_sorted[2:2:N])
    return Alice_get - Bob_get
end

function main()
    parseInt(str=readline()) = parse.(Int, split(str))
    N = parseInt()[1]
    a = parseInt()
    output = card_game_for_two(N, a)
    println(output)
end


if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
