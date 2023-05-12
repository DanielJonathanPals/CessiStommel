# This file contains the deterministic part of the RHS of the differential equations driving the 5 Box
# model.

include("SystemArrayConverter.jl")


function rhs_deterministic(arr::Array{Float64})
    y = get_y(arr)
    μ = get_μ(arr)
    p = get_p(arr)
    return .-(1 .+ μ.^2 .* (y .- 1) .^2) .* y .+ p
end


function rhs_stochastic(arr::Array{Float64})
    D = get_D(arr)
    return sqrt.(2*abs.(D))
end


rhs_deterministic(sys::System) = rhs_deterministic(toArray(sys))
rhs_stochastic(sys::System) = rhs_stochastic(toArray(sys))