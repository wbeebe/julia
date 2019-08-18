#!/usr/bin/env julia
#
println(" Running with ", VERSION)
macro VarName(var)
    string(var)
end

function printsum(varname, a)
    println(" ", varname, " => ", summary(a), ": ", repr(a))
end

function printline(varname, a)
    println(" ", varname, " => ", a)
end

struct Person
	name::AbstractString
	male::Bool
	age::Float64
	children::Int
end

p = Person("Julia", false, 4, 0)
printsum(@VarName(p), p)
#> Person: Person("Julia",false,4.0,0)

people = Person[]
push!(people, Person("Steve", true, 42, 0))
push!(people, Person("Jade", false, 17, 3))
printsum(@VarName(people), people)
#> 2-element Array{Person,1}: [Person("Steve",true,42.0,0),Person("Jade",false,17.0,3)]

# types may also contains arrays and dicts
# constructor functions can be defined to easily create objects
struct Family
	name::AbstractString
	members::Array{AbstractString, 1}
	extended::Bool
	# constructor that takes one argument and generates a default
	# for the other two values
	Family(name::AbstractString) = new(name, AbstractString[], false)
	# constructor that takes two arguements and infers the third
	Family(name::AbstractString, members) = new(name, members, length(members) > 3)
end

fam1 = Family("blogs")
printline(@VarName(fam1), fam1)
#> Family("blogs",AbstractString[],false)
fam2 = Family("jones", ["anna", "bob", "charlie", "dick"])
printline(@VarName(fam2), fam2)
#> Family("jones",AbstractString["anna","bob","charlie","dick"],true)
