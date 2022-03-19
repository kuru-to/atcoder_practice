using DataStructures

"""
inputのデータをもとに処理を実行
"""
function run(N::Int, M::Int, A::Vector{Int})::Int
    # ヒープの導入
    h = BinaryMinMaxHeap(A)

    for _ in 1:M
        # 一番値段の高い品物に割引券を使用
        max_price = popmax!(h)
        push!(h, div(max_price, 2))
    end

    return sum(popall!(h))
end

function main()
    parseInt(str=readline()) = parse.(Int, split(str))
    N, M= parseInt()
    A = parseInt()

    output = run(N, M, A)
    println(output)
end
# main()
