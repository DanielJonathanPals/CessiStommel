module RHS_module

export System
export PresetSystem

export ParameterSet
export updateParameterSet!
export PresetParams

export toArray
export updateSystem!

export rhs_deterministic
export rhs_stochastic

export get_index
export get_μ
export get_p
export get_D
export get_y

include("RHS.jl")

end