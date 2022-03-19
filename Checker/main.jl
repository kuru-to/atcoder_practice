struct Point
    x::Int
    y::Int
end

"""
希望の点と色について, K*Kの盤面に縮約し, 各点に希望する点がいくつあるかの行列を出力

メモリ削減のため Sparce matrix を出力

Returns:
    各色の希望がどの点にいくつ存在するかを表す行列
"""
function reduce_K_square(
    K::Int, lst_point::Vector{Point}, lst_color::Vector{String}
)::Tuple{Matrix{Int}, Matrix{Int}}
    needs_black = zeros(Int, K, K)
    needs_white = zeros(Int, K, K)

    for (p, c) in zip(lst_point, lst_color)
        # Kで割ったあまりがK*K盤面上の点になる
        # 各座標は0始まりのためずらす
        p_x_in_K_square = p.x % K + 1
        p_y_in_K_square = p.y % K + 1
        # 商の合計が偶数ならば同じ色, 奇数ならば別の色に変わる
        is_odd_div = (div(p.x, K) + div(p.y, K)) % 2
        if c == "B"
            if is_odd_div == 0
                needs_black[p_x_in_K_square, p_y_in_K_square] += 1
            else
                needs_white[p_x_in_K_square, p_y_in_K_square] += 1
            end
        else
            if is_odd_div == 0
                needs_white[p_x_in_K_square, p_y_in_K_square] += 1
            else
                needs_black[p_x_in_K_square, p_y_in_K_square] += 1
            end
        end
    end

    return (needs_black, needs_white)
end

function run(N::Int, K::Int, lst_point::Vector{Point}, lst_color::Vector{String})::Int
    # 点をK*Kの盤に格納する
    needs_black, needs_white = reduce_K_square(K, lst_point, lst_color)

    # 累積和をあらかじめ計算しておく
    cum_black, cum_white = cumulate_needs(K, needs_black, needs_white)

    # かなえられる要望の数. どれか1つは確実に設定できるので1
    count = 1
    # 各点ごとに区切りを分けて希望をどれだけ満たせるか確認
    for i in 1:K
        for j in 1:K
            count_b = meet_needs_by_point(K, i, j, cum_black, cum_white)
            count_w = meet_needs_by_point(K, i, j, cum_white, cum_black)
            count = max(count, count_b, count_w)
            if count == N
                return count
            end
        end
    end
    return count
end



"""
累積和の計算. (0, 0)~(i, j) までに希望する色が何個含まれているかを行列形式で出力

Returns
    (0, 0)~(i, j) までに含まれる対象の色の希望数
"""
function cumulate_needs(
    K::Int, needs_black::Matrix{Int}, needs_white::Matrix{Int}
)::Tuple{Matrix{Int}, Matrix{Int}}
    cum_black = zeros(Int, K+1, K+1)
    cum_white = zeros(Int, K+1, K+1)
    for i in 1:K
        for j in 1:K
            cum_black[i+1, j+1] = cum_black[i+1, j] + needs_black[i, j]
            cum_white[i+1, j+1] = cum_white[i+1, j] + needs_white[i, j]
        end
    end
    for i in 1:K
        for j in 1:K
            cum_black[i+1, j+1]+= cum_black[i, j+1]
            cum_white[i+1, j+1]+= cum_white[i, j+1]
        end
    end
    return (cum_black[2:K+1, 2:K+1], cum_white[2:K+1, 2:K+1])
end

"""
(i, j) を区切りに黒にする場合の希望を満たせる点の数の出力

色を入れ替える場合は引数を入れ替えればよい
"""
function meet_needs_by_point(K::Int, i::Int, j::Int, cum_black::Matrix{Int}, cum_white::Matrix{Int})
    # 黒の希望を満たせる数
    sum_meet_needs_black = cum_black[K, K] - cum_black[K, j] - cum_black[i, K] + 2 * cum_black[i, j]

    # 白の希望を満たせる数
    sum_meet_needs_white = cum_white[K, j] + cum_white[i, K] - 2 * cum_white[i, j]

    return sum_meet_needs_black + sum_meet_needs_white
end

function main()
    parseInt(str=readline()) = parse.(Int, split(str))
    N, K = parse.(Int, split(readline()))

    # 希望の点と色について, K*Kの盤面に縮約し, 各点に希望する点がいくつあるかの行列を出力
    # メモリ削減のため Sparce matrix を出力
    needs_black = zeros(Int, K, K)
    needs_white = zeros(Int, K, K)
    for _ in 1:N
        x_y_c = split(readline())
        x = parse(Int, x_y_c[1])
        y = parse(Int, x_y_c[2])
        c = x_y_c[3]

        # Kで割ったあまりがK*K盤面上の点になる
        # 各座標は0始まりのためずらす
        p_x_in_K_square = x % K + 1
        p_y_in_K_square = y % K + 1
        # 商の合計が偶数ならば同じ色, 奇数ならば別の色に変わる
        is_odd_div = (div(x, K) + div(y, K)) % 2
        if c == "B"
            if is_odd_div == 0
                needs_black[p_x_in_K_square, p_y_in_K_square] += 1
            else
                needs_white[p_x_in_K_square, p_y_in_K_square] += 1
            end
        else
            if is_odd_div == 0
                needs_white[p_x_in_K_square, p_y_in_K_square] += 1
            else
                needs_black[p_x_in_K_square, p_y_in_K_square] += 1
            end
        end
    end

    # 累積和をあらかじめ計算しておく
    cum_black, cum_white = cumulate_needs(K, needs_black, needs_white)

    # 各点ごとに区切りを分けて希望をどれだけ満たせるか確認
    count = 1
    for i in 1:K
        for j in 1:K
            count_b = meet_needs_by_point(K, i, j, cum_black, cum_white)
            count_w = meet_needs_by_point(K, i, j, cum_white, cum_black)
            count = max(count, count_b, count_w)
            # すべての希望を満たせた場合は即座に終了
            if count == N
                println(count)
                return
            end
        end
    end
    println(count)
end
main()
