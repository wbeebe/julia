#!/usr/bin/env julia

using Printf

# What is interesting in Julia is the @printf macro vs
# the println function. In addition to the use of the '@'
# prefix, println uses standard open and close parenthesis
# where @printf doesn't.

println("Hello, world!")

@printf "Hello, world with print macro!\n"
