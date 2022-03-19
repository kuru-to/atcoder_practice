"""
inputのデータをもとに処理を実行
"""
function run(N::Int, A::Array{Int}, B::Array{Int})::Int
    # 勇者が倒せたモンスターの総数
    count = 0

    for i in 1:N
        # 自分がいる街をできるだけ倒す
        max_count_i = min(A[i], B[i])
        # 残りを隣の街で倒す
        max_count_i_plus_one = min(A[i+1], B[i] - max_count_i)

        # 倒した数更新
        count += max_count_i + max_count_i_plus_one
        # 残りの数更新
        A[i+1] -= max_count_i_plus_one
    end

    return count
end

function main()
    parseInt(str=readline()) = parse.(Int, split(str))
    N = parse(Int, readline())
    A = parseInt()
    B = parseInt()

    output = run(N, A, B)
    println(output)
end
# main()
