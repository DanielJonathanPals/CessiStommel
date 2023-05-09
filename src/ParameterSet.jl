# In this file the Struct ParameterSet is introduces which is a mutable stuct containing all the relevant
# parameters of the considered system. Further down some preset parameter sets are defined.

import Base.@kwdef


"""
    ParameterSet

Stuct whos fields describe all Parameters of a given System. The fields are to be given as keyword arguments.
The final system follows the stochstic differential equation dy = (-[1 + μ²(y-1)²]y + p)dt + √(2D) dW 

# Fields

- `μ::Number`
- `p::Number`
- `D::Number`: Diffution constant
"""
@kwdef mutable struct ParameterSet
    μ::Number
    p::Number
    D::Number
end


"""
    updateParameterSet!(params::ParameterSet, arr::Array)

Updates the given `ParameterSet` with the values given in the Array.
"""
function updateParameterSet!(params::ParameterSet, arr::Array)
    if length(arr) != 3
        error("The array should have length 3")
    end
    params.μ = arr[1]
    params.p = arr[2]
    params.D = arr[3]
end


"""
    PresetParams

A `ParameterSet` containing the values as given in the paper
"""
PresetParams = ParameterSet(μ = 2.49,
                            p = 1.1,
                            D = 4e3)