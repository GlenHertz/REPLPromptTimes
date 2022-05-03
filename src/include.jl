# Don't paste into REPL, use `include("prompt_times.jl")`

using REPL
using Printf
@eval REPL begin
     const LAST_TIME = Ref{Float64}(time())
     const PROMPT_CACHE  = Ref{Union{String, Nothing}}(nothing)
end

# Format the time printing here as you wish
function prettytime(t)
    if REPL.PROMPT_CACHE[] !== nothing
        return REPL.PROMPT_CACHE[]
    end
    if t < 1e2
        value, units = t, "ns"
    elseif t < 1e5
        value, units = t / 1e3, "μs"
    elseif t < 1e8
        value, units = t / 1e6, "ms"
    elseif t < 120e9
        value, units = t / 1e9, "s"
    elseif t < 1e9*60*90
	value, units = t / 60e9, "min"
    else
	value, units = t / 3600e9, "hr"
    end
    s = string(round(value, sigdigits=3), " ", units)
    REPL.PROMPT_CACHE[] = s
    return s
end


julia_repl = Base.active_repl.interface.modes[1]
old_f = julia_repl.on_done
julia_repl.on_done = (args...) -> (REPL.LAST_TIME[] = time(); REPL.PROMPT_CACHE[] = nothing; old_f(args...))
julia_repl.prompt = () -> string("julia [", prettytime((time() - REPL.LAST_TIME[])*1e9), "]> ")
