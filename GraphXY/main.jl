"""
辺を表す構造体
ラベルか重みかはのちに決定される
"""
struct Edge
    departure::Int
    destination::Int
    weight::Int
    label::String

    # ラベルはつかないことがデフォルトにしたいのでコンストラクタ定義
    Edge(x, y, w) = new(x, y, w, "")
end

"""
グラフを表す構造体
出力はこの形式になる
"""
struct Graph
    N::Int
    M::Int
    lst_edge::Vector{Edge}
end

"""
重みが増えるのに最短距離が減ることはありえないため, 距離行列が減っている場合は出力不可能と判定する
"""
function is_decrease_min_distance(A::Int, B::Int, mat_dist::Matrix{Int})::Bool
    for i in 1:(A-1)
        for j in 1:(B-1)
            if mat_dist[i, j] > mat_dist[i+1, j] || mat_dist[i, j] > mat_dist[i, j+1]
                return true
            end
        end
    end
    return false
end

"""
inputのデータをもとに処理を実行

対象のグラフが見つからなかった場合は nothing を返す
"""
function run(A::Int, B::Int, mat_dist::Matrix{Int})::Tuple{Graph, Int, Int}
    if is_decrease_min_distance(A, B, mat_dist)
        return
    end

    return
end

function main()
    parseInt(str=readline()) = parse.(Int, split(str))
    A, B = parseInt()

    # 各a,bでの最短距離になる行列
    mat_dist = zeros(Int, A, B)
    for a_i in 1:A
        mat_dist[a_i, :] = parseInt()
    end

    output = run(A, B, mat_dist)
    if isnothing(output)
        println("Impossible")
    end
end
# main()
