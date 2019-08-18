#!/usr/bin/env julia

# There are a lot of Julia examples that use the REPL and not
# scripting. For something as simples as @printf, you need to
# use the 'using Printf' which is Julia's equivalent to import
# or include. That's because printf was moved out of core Julia
# in the Julia 1.0 release.

using Printf

# Simple function to calculate the volume of a sphere.
#
VolumeSphere(r) = (4/3 * pi * r^3)

# And a simple way to test it all.
#
volume = VolumeSphere(3)
@printf "volume = %0.3f\n" volume
