struct Point
    x::Int
    y::Int
end

function run(K::Int, lst_point::Vector{Point}, lst_color::Vector{String})::Int
    # かなえられる要望の数. どれか1つは確実に設定できるので1
    count = 1
    # Kで割ったあまりがいくつになるかによって探索
    for k_x in 0:(K-1)
        for k_y in 0:(K-1)
            # 各点の偶奇を記録
            lst_isodd = [(div(p.x + k_x, K) + div(p.y + k_y, K)) % 2 for p in lst_point]
            # 偶奇の組み合わせによって色分けが一番大きいほうを選ぶ
            for target_c in ["B", "W"]
                lst_matched = [is_odd == (c==target_c) for (is_odd, c) in zip(lst_isodd, lst_color)]
                count = max(count, sum(lst_matched))
            end
        end
    end
    return count
end

function main()
    parseInt(str=readline()) = parse.(Int, split(str))
    N, K = parse.(Int, split(readline()))
    lst_color::Vector{String} = []
    lst_point::Vector{Point} = []
    for _ in 1:N
        x_y_c = split(readline())
        push!(lst_point, Point(parse(Int, x_y_c[1]), parse(Int, x_y_c[2])))
        push!(lst_color, x_y_c[3])
    end
    output = run(K, lst_point, lst_color)
    println(output)
end


if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
