#!/usr/bin/env julia
#
# Pkg.add("Winston") should only be done with Julia REPL, and
# it must be done with sudo.
#
using Winston

# plot some data
pl = plot(cumsum(rand(500) .- 0.5), "r", cumsum(rand(500) .- 0.5), "b")
# display the plot (not done automatically!)
display(pl)

# save the current figure
savefig("winston.svg")
# .eps, .pdf, & .png are also supported
# we used svg here because it respects the width and height specified above
