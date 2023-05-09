include("ParameterSet.jl")


"""
    System

Mutalbe struct which carries the y value as well as the parameter values of a given 
    system

# Fields

- `y::Number`: Current position of the system
- `params::ParameterSet`: Contains the current parameters describing the system
"""
mutable struct System
    y::Number
    params::ParameterSet
end


"""
    System(;y::Number, params::ParameterSet)

Returns an element of the type `System`, of the form `System(y,params)`
"""
function System(;y::Number, params::ParameterSet)
    System(y,params)
end

# Change the value of a specific silinity of a given system
up_y!(sys::System, s::Number) = sys.y = Float64(s)


# FAMOUS System
"""
    PresetSystem


Preset of a instance of type `System`
"""
PresetSystem = System(y = 0.2, params = PresetParams)