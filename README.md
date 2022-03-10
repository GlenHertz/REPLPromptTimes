# REPLPromptTimes
Enhances the Julia REPL prompt to include the run time of the previous command.

## Usage

Don't paste the code into the REPL, but `include` it like so:

```julia
julia> include("../REPLPromptTimes.jl/prompt_times.jl")
#7 (generic function with 1 method)

julia [0.227 s]> sleep(5)

julia [5.02 s]>
```