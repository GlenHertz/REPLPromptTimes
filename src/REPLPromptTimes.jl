module REPLPromptTimes

function __init__()
	println("Paste the following into your Julia REPL:")
	println("""include(joinpath(dirname(pathof(REPLPromptTimes)), "include.jl"))""")
end

end #module
