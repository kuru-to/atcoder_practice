# using LinearAlgebra

function run(N::Int, t::Array{Int, 1}, lst_point::Array{Int, 2})::Bool
    now_t = 0
    now_point = [0, 0]

    for i in 1:N
        next_t = t[i]
        next_point = lst_point[i, :]

        dist_vec = next_point .- now_point
        distance = abs(dist_vec[1]) + abs(dist_vec[2])
        lead_time = next_t - now_t
        if ((lead_time - distance) % 2 == 1) || distance > lead_time
            return false
        end

        now_t = next_t
        now_point = next_point
    end
    return true
end

function main()
    parseInt(str=readline()) = parse.(Int, split(str))
    N = parseInt()[1]
    t = zeros(Int, N)
    lst_point = zeros(Int, (N, 2))
    for i in 1:N
        t_x_y = parseInt()
        t[i] = t_x_y[1]
        lst_point[i, :] = [t_x_y[2], t_x_y[3]]
    end
    output = run(N, t, lst_point)
    if output println("Yes") else println("No") end
end


if abspath(PROGRAM_FILE) == @__FILE__
    main()
end
