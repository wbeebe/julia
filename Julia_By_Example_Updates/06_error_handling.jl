#!/usr/bin/env julia
#
a=[]

try
    push!(a,1)
    println(a)
catch err
    println("Error caught.")
    showerror(STDOUT, err, backtrace());println()
end

println("Continuing after error")
