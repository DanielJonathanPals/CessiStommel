using CessiStommel
using Documenter

DocMeta.setdocmeta!(CessiStommel, :DocTestSetup, :(using CessiStommel); recursive=true)

makedocs(;
    modules=[CessiStommel],
    authors="Daniel Pals <Daniel.Pals@tum.de>",
    repo="https://github.com/DanielJonathanPals/CessiStommel.jl/blob/{commit}{path}#{line}",
    sitename="CessiStommel.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        edit_link="master",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)
