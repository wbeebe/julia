#!/usr/bin/env julia
#
# repeat can be useful to expand a grid
# as in R's expand.grid() function:

println(" Running with Julia ", VERSION)

macro VarName(arg)
    string(arg)
end

function printsum(varName, a)
    print(" ", varName, " => ")
    println(summary(a), ": ", repr(a))
end

m1 = hcat(repeat([1,2],inner=[1],outer=[3*2]),
		  repeat([1,2,3],inner=[2],outer=[2]),
		  repeat([1,2,3,4],inner=[3],outer=[1]))
printsum(@VarName(m1), m1)
#> 12×3 Array{Int64,2}: [1 1 1; 2 1 1; 1 2 1; 2 2 2; 1 3 2; 2 3 2; 1 1 3; 2 1 3; 1 2 3; 2 2 4; 1 3 4; 2 3 4]

# for simple repetitions of arrays,
# use repmat - no, use repeat now
m2 = repeat(m1,1,2) 	# replicate a9 once into dim1 and twice into dim2
println(" ", @VarName(m2), " => size: ", size(m2))
#> size: (12,6)

m3 = repeat(m1,2,1) 	# replicate a9 twice into dim1 and once into dim2
println(" ", @VarName(m3), " => size: ", size(m3))
#> size: (24,3)

# Julia comprehensions are another way to easily create
# multidimensional arrays

m4 = [i+j+k for i=1:2, j=1:3, k=1:2]	# creates a 2x3x2 array of Int64
m5 = ["Hi Im # $(i+2*(j-1 + 3*(k-1)))" for i=1:2, j=1:3, k=1:2]
# expressions are very flexible
# you can specify the type of the array by just
# placing it in front of the expression
import Pkg
#Pkg.add("LegacyStrings")
import LegacyStrings
m5 = LegacyStrings.ASCIIString["Hi Im element # $(i+2*(j-1 + 3*(k-1)))" for i=1:2, j=1:3, k=1:2]
printsum(@VarName(m5), m5)
#> 2x3x2 Array{LegacyStrings.ASCIIString,3}: LegacyStrings.ASCIIString["Hi Im element # 7"
#> "Hi Im element # 9" "Hi Im element # 11"
#>             "Hi Im element # 8" "Hi Im element # 10" "Hi Im element # 12"]
#>
#> LegacyStrings.ASCIIString["Hi Im element # 7" "Hi Im element # 9" "Hi Im element # 11"
#>             "Hi Im element # 8" "Hi Im element # 10" "Hi Im element # 12"]

# Array reductions
# many functions in Julia have an array method
# to be applied to specific dimensions of an array:

sum(m4,dims=3)		# takes the sum over the third dimension
sum(m4,dims=(1,3))	# sum over first and third dim

maximum(m4,dims=2)	# find the max elt along dim 2
findmax(m4,dims=3)	# find the max elt and its index along dim 3 (available only in very recent Julia versions)

# Broadcasting
# when you combine arrays of different sizes in an operation,
# an attempt is made to "spread" or "broadcast" the smaller array
# so that the sizes match up. broadcast operators are preceded by a dot:

m4 .+ 3		# add 3 to all elements
m4 .+ [1,2]		# adds vector [1,2] to all elements along first dim

# slices and views
m4=m4[:,:,1]	# holds dim 3 fixed
m4[:,2,:]	# that's a 2x1x2 array. not very intuititive to look at

# get rid of dimensions with size 1:
# squeeze is now dropdims #618
dropdims(m4[:,2,:],dims=2)	# that's better

# assign new values to a certain view
m4[:,:,1] = rand(1:6,2,3)
printsum(@VarName(m4), m4)
#> 2×3 Array{Int32,2}: [3 2 3; 4 4 5]

println(" Deliberate error testing.")
# (for more examples of try, catch see Error Handling above)
try
	# this will cause an error, you have to assign the correct type
	m4[:,:,1] = rand(2,3)
catch err
	println(err)
end
#> InexactError()

try
	# this will cause an error, you have to assign the right shape
	m4[:,:,1] = rand(1:6,3,2)
catch err
	println(err)
end
#> DimensionMismatch("tried to assign 3x2 array to 2x3x1 destination")
