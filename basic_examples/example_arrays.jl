#!/usr/bin/env julia

using Printf

DumpArray(a) = println(summary(a), ": ", repr(a))

println( " \nJulia Array Examples\n" )

a1 = [1,2,3]
DumpArray(a1)
push!(a1,4)
DumpArray(a1)

a2 = []
DumpArray(a2)

a3 = ['a','b','c']
DumpArray(a3)
push!(a3, 1)
DumpArray(a3)

a4 = [['a','b','c'],[1,2,3]]
DumpArray(a4)
#
# NOTE: Array indexing is 1 based, not zero based.
#
DumpArray(a4[1]) # Dump first internal array
DumpArray(a4[2]) # Dump second internal array

a5 = ["hello", 'w', 'o', 'r', 'l', 'd']
DumpArray(a5)

a6 = 1:10
DumpArray(a6)
a6 = collect(1:10)
DumpArray(a6)

a7 = [i for i = 1:10]
DumpArray(a7)
a7 = [i*2 for i = 1:10]
DumpArray(a7)

a8 = (Array{Int128, 1})[]
DumpArray(a8)
a8 = repeat(a1, inner=[2], outer=[1])
DumpArray(a8)
a8 = repeat(collect(9:-1:0), inner=[1], outer=[3])
DumpArray(a8)
