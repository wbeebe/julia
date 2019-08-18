#!/usr/bin/env julia

using Printf

quad(a, squareRoot, b) = (-b + squareRoot) / 2a

# Solves x for a*x^2 + b*x + c = 0.
# Arguments types can be defined in function definitions
#
function QuadraticSolver(a::Float64, b::Float64, c::Float64)
    squareRoot = sqrt(b^2-4a*c)
    r1 = quad(a, squareRoot, b)
    r2 = quad(a, -squareRoot, b)

    r1, r2
end

# Solve for 2x^2 - 2x -12 = 0
#
result1, result2 = QuadraticSolver(2.0, -2.0, -12.0)
println("result 1: ", result1)
println("result 2: ", result2)
