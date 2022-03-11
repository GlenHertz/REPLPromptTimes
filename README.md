# REPLPromptTimes
Enhances the Julia REPL prompt to include the run time of the previous command.

## Usage

Don't paste the code into the REPL, but `include` it like so:

```julia
julia> using REPLPromptTimes
Paste the following into your Julia REPL:
include(joinpath(dirname(pathof(REPLPromptTimes)), "include.jl"))

julia> include(joinpath(dirname(pathof(REPLPromptTimes)), "include.jl"))
#7 (generic function with 1 method)

julia [0.223 s]> sleep(0.9)

julia [0.903 s]>
```