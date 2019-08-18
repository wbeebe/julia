#!/usr/bin/env julia
#
s1 = "The quick brown fox jumps over the lazy dog α,β,γ"
println(VERSION)
# find the first instance in the string of a given character.
i = findfirst(isequal('b'), s1)
println(i)
#> 11

# or a range if called with another string
r = findfirst("brown", s1)
println(r)
#> 11:15

# replace one substring with another.
r = replace(s1, "brown" => "red")
show(r); println()
#> "The quick red fox jumps over the lazy dog"

# findfirst can also take a regular expressions by preceding the string with 'r'.
r = findfirst(r"b[\w]*n", s1)
println(r)
#> 11:15

# again with a regular expression
r = replace(s1, r"b[\w]*n" => "red")
show(r); println()
#> "The quick red fox jumps over the lazy dog"

# there are also functions for regular expressions that return RegexMatch types
r = match(r"b[\w]*n", s1)
println(r)
#> RegexMatch("brown")

# RegexMatch types have a property match that holds the matched string
show(r.match); println()
#> "brown"

# r = matchall(r"[\w]{4,}", s1)
#> SubString{UTF8String}["quick","brown","jumps","over","lazy"]
r = collect(eachmatch(r"[\w]{4,}", s1))
println(r)
#> RegexMatch[RegexMatch("quick"), RegexMatch("brown"), RegexMatch("jumps"), RegexMatch("over"), RegexMatch("lazy")]

r = eachmatch(r"[\w]{4,}", s1)
for i in r print("\"$(i.match)\" ") end
println()
#> "quick" "brown" "jumps" "over" "lazy" 

r = "hello "^3
show(r); println() #> "hello hello hello "

# e.g., with one argument it strips the outer whitespace
r = strip("hello ")
show(r); println() #> "hello"
# or with a second argument of an array of chars it strips any of them;
r = strip("hello ", ['h', ' '])
show(r); println() #> "ello"
# (note the array is of chars and not strings)

r = split("hello, there,bob", ',')
show(r); println() #> ["hello"," there","bob"]
r = split("hello, there,bob", ", ")
show(r); println() #> ["hello","there,bob"]
r = split("hello, there,bob", [',', ' '], limit=0, keepempty=false)
show(r); println() #> ["hello","there","bob"]

r = join(collect(1:10), ", ")
println(r) #> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
