#!/usr/bin/env julia
#
using Printf

println(" Running with Julia ", VERSION)

macro VarName(arg)
    string(arg)
end

function printsum(varname, a)
    println(" ", varname, " => ", summary(a), ": ", repr(a))
end

function printline(varname, a)
    println(" ", varname, " => ", a)
end

# dictionaries can be initialised directly:
a1 = Dict(1=>"one", 2=>"two")
printsum(@VarName(a1), a1) #> Dict{Int64,String}: {2=>"two",1=>"one"}

# then added to:
a1[3]="three"
printsum(@VarName(a1), a1) #> Dict{Int64,String}: {2=>"two",3=>"three",1=>"one"}
# (note dictionaries cannot be assumed to keep their original order)

# dictionaries may also be created with the type explicitly set
a2 = Dict{Int64, AbstractString}()
a2[0]="zero"
printsum(@VarName(a2), a2)
#> Dict{Int64,AbstractString} with 1 entry: Dict{Int64,AbstractString}(Pair{Int64,AbstractString}(0,"zero"))

# dictionaries like arrays, may also be created from comprehensions
a3 = Dict([i => @sprintf("%d", i) for i = 1:10])
printsum(@VarName(a3), a3)
#> Dict{Any,Any}: {5=>"5",4=>"4",6=>"6",7=>"7",2=>"2",10=>"10",9=>"9",8=>"8",3=>"3",1=>"1"}

# as you would expect, Julia comes with all the normal helper functions
# for dictionaries
printline(@VarName(a1), haskey(a1,1)) #> true

# which is equivalent to
printline(@VarName(a1), 1 in keys(a1)) #> true
# where keys creates an iterator over the keys of the dictionary

# similar to keys, values get iterators over the dict's values:
printsum(@VarName(a1), values(a1)) 
#> Base.ValueIterator for a Dict{Int64,String} with 3 entries: String["two","three","one"]

# use collect to get an array:
printsum(@VarName(a1), collect(values(a1)))
#> 3-element Array{String,1}: String["two","three","one"]
