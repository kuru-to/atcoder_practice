function run(S::String)::Bool
    target_str = ["dream", "dreamer", "erase", "eraser"]

    while length(S) > 0
        dividable = false
        for str in target_str
            if endswith(S, str)
                S = S[1:length(S) - length(str)]
                dividable = true
                break
            end
        end
        if ~dividable
            return false
        end
    end
    return true
end

function main()
    S = readline()
    output = run(S)
    if output println("YES") else println("NO") end
end


if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
