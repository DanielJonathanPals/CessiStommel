# In this file the struct ParameterDynamics is introduced which is a struct containing a field which
# describes how to update the parameters during a runthough of the system.

using .RHS_module

"""
    ParameterDynamics

A mutable struct which encodes the RHS of the dynamics of the parameter space

# Fields
- `f!::Function`: Describes the deterministic dynamics in parameter space with `f!` of the from
    `f!(du,u,t_0,t)` with `length(du) = length(u) = 26` and `u` contains all the salinities
    together with all the parameter values. Since the system in run in sub-time-intervals
    the current time is given by `t+t_0` which which is relevent it the system is non autonomous.
    Also note that all times are given in the unit of years in order to avoid very large numbers 
    for `t`.
- `g!::Function`: Describes the stochastic dynamics in parameter space and is of the same form
    as `f!`
- `noise_rate_prototype::Matrix{Float64}`: Is some Matrix with the same dimensions as the `du` 
    argument in `g!` which is later needed to set up the `SEDProblem` from the DifferentialEquations
    package. If `noise_rate_prototype === nothing` then diagonal noise is used and `du` has the
    form of a Vector. Note that `noise_rate_prototype` must be the same must have the same sizes
    for corresponding instances of the ParameterDynamics and PhaseDynamics strucs.

If only `f!` and `g!` are given then `update` will be initialized to `update = nothing`
"""
mutable struct ParameterDynamics
    f!::Function
    g!::Function
    noise_rate_prototype::Union{Matrix{Float64},Nothing}
end


"""
    ParameterDynamics(f!::Function, 
                        g!::Function;   
                        noise_rate_prototype::Union{Matrix{Float64},Nothing} = nothing,
                        update = nothing)
                    
Alternative instantiation which returns an object of `ParameterDynamics`.
"""
function ParameterDynamics(f!::Function, 
                            g!::Function;   
                            noise_rate_prototype::Union{Matrix{Float64},Nothing} = nothing)
    ParameterDynamics(f!,g!,noise_rate_prototype)
end


"""
    function no_deterministic_param_dynamics!(du, u, t_0, t)

This function encodes the deterministic part of the ODEs describing the dynamics of the parameters
    in the case where the parameters do not change deterministically with time. This can be used
    as argument for `f!` when ceating an instance of the type `ParameterDynamics`.
"""
function no_deterministic_param_dynamics!(du, u, t_0, t)
    du[get_index["parameters"]] .= 0.
end


"""
    no_stochastic_param_dynamics!(du, u, t_0, t)

This function encodes the stochastic part of the ODEs describing the dynamics of the parameters
    in the case where this part is zero. This can be used
    as argument for `g!` when ceating an instance of the type `ParameterDynamics`.
"""
function no_stochastic_param_dynamics!(du, u, t_0, t)
    du[get_index["parameters"]] .= 0.
end


"""
    fixedParameters

This is a preset of the type `ParameterDynamics` where the parameters do not change during the evolution of
    the system.
"""
fixedParameters = ParameterDynamics(no_deterministic_param_dynamics!,
                                    no_stochastic_param_dynamics!)