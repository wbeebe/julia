# Julia

A collection of Julia projects tested on macOS and Raspbian Buster 64-bit.

## Update 7 November 2020

Biden Wins! Also, all scripts have been tested with Julia 1.5.2.

## Update 19 August 2019

Note that as of August 2019 all the applications are using Julia 1.2.0 RC3.

* Four more updated Julia examples added (11 through 14).
* simple.dat data file for 11_input_and_output.jl
* iris.csv data file for 14_dataframes.jl
* 14_dataframes.jl still has two deprecation warnings. Look for "Warning:" in the comments.

To run the Julia By Example scripts the following Julia packages must be installed:

*  "DataFrames"    => v"0.19.2"
*  "RData"         => v"0.6.2"
*  "Winston"       => v"0.15.0"
*  "Calculus"      => v"0.5.0"
*  "CSV"           => v"0.5.11"
*  "LegacyStrings" => v"0.4.1"
*  "RDatasets"     => v"0.6.3"

The versions are what was available at the time, and will change going forward.
Versioning is not canonical.

## Update 18 August 2019

I'm using Julia again and enjoying the experience.

With the release of Julia 1.2.0 RC3 and the release of Raspbian Buster running
on a Raspberry Pi 4B, I've come back to using Julia. It's much faster all around
and as a consequence more of a pleasure. There's still problems with the tutorials,
especially Julia By Example. I'm now fixing the issues with the tutorials and in
the process learning about Julia beyond 1.0. You'll find the fixed Julia By Example
source files in the folder Julia_By_Example_Updates.

## Update September 2018

I've pretty much stopped any work with Julia. I tried to investigate how Julia handles
concurrency and their version of coroutines, only to discover that none of the official
totorials would work with Julia 1.0. I've already got a very good implementation with
Go, and that's where I'll stay exclusively for the time being.

## License

    Copyright (c) 2018 William H. Beebe, Jr.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
