# Here the back and forth conversion from the information in a System to an Array is implemented

include("System.jl")


"""
    ToArray(sys::System)

Converts the data contained in the System into an array
"""
function toArray(sys::System)
    return [sys.y,
            sys.params.μ,
            sys.params.p,
            sys.params.D]
end


"""
    updateSystem!(sys::System, arr::Array{Float64})

Updates the values in the System according to the values given in the array.
"""
function updateSystem!(sys::System, arr::Array{Float64})
    if length(arr) != 4
        error("The array does not have the correct length, which should be 4")
    end
    sys.y = arr[1]
    updateParameterSet!(sys.params, arr[2:4])
end


"""
    get_index

When converting objects of type `System` into Arrays it might be confusiong to ceep track
    to which entry in the array encodes which variable. The dictionary `get_index` encodes
    exactly this information where the keys are the names of the respective variables.
"""
get_index = Dict("y" => 1,
                "μ" => 2,
                "p" => 3,
                "D" => 4,
                "parameters" => 2:4)


# get the respective parameter Values from array
get_y(arr::Array{Float64}) = ((ndims(arr) == 1) ? arr[1] : arr[1,:])
get_μ(arr::Array{Float64}) = ((ndims(arr) == 1) ? arr[2] : arr[2,:])
get_p(arr::Array{Float64}) = ((ndims(arr) == 1) ? arr[3] : arr[3,:])
get_D(arr::Array{Float64}) = ((ndims(arr) == 1) ? arr[4] : arr[4,:])


# get the respective parameter Values from the system
get_y(sys::System) = get_y(toArray(sys))
get_μ(sys::System) = get_μ(toArray(sys))
get_p(sys::System) = get_p(toArray(sys))
get_D(sys::System) = get_D(toArray(sys))