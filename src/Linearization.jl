using LinearAlgebra

using .RHS_module


"""
    jacobian(arr::Vector{Float64})

Computes the Jacobian for at the given data of the RHS of the ODE describing the
    time evolution of the salinities. 
"""
function jacobian(arr::Vector{Float64})
    y = get_y(arr)
    μ = get_μ(arr)
    p = get_p(arr)
    return -(1 + μ^2 * (y - 1)^2) - 2 * μ^2 * (y - 1) * y
end


"""
    jacobian(arr::Array{Float64})

Computes the Jacobian for each timepoint in the given trajectory of the RHS of the ODE describing the
    time evolution of the salinities. 
"""
function jacobian(arr::Array{Float64})
    n = size(arr)[2]
    lin = Vector{Float64}(undef,n)
    for i in 1:n
        lin[i] = jacobian(arr[:,i])
    end
    return lin
end


"""
    jacobian(sys::System)

Computes the Jacobian of the RHS of the ODE describing the
    time evolution of the salinities for the given System. 
"""
function jacobian(sys::System)
    return jacobian(toArray(sys))
end


function get_eigvals(x::Float64)
    return x
end


function get_eigvals(x::Array{Float64})
    if ndims(x) == 1
        return jacobian(x)
    else
        n = size(x)[2]
        eigs = zeros(ComplexF64,(n))
        for i in 1:n
            eigs[i] = jacobian(x[:,i])
        end
        return eigs
    end
end


"""
    get_eigvals(sys::System)

The function returns the eigenvalues of the linearized version of the given System.
"""
function get_eigvals(sys::System)
    get_eigvals(toArray(sys))
end