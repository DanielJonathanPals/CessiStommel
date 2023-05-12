module CessiStommel

export jacobian
export get_eigvals

export ParameterDynamics
export no_deterministic_param_dynamics!
export no_stochastic_param_dynamics!
export fixedParameters

export PhaseDynamics
export deterministic_salinity_dynamics!
export original_deterministic_salinity_dynamics!
export no_stochstic_salinity_dynamics!
export DeterministicPhaseDynamics
export OriginalDeterministicPhaseDynamics

export ParameterSet
export FAMOUSparams

export SinglePlot
export createSinglePlot
export combine_plots

export RunParameters
export runSystem

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

include("RHS_module.jl")
include("Plot.jl")
include("RunSystem.jl")
include("Linearization.jl")

end
