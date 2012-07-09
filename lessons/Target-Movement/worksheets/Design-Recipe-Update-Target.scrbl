#lang curr/lib

@design-recipe-exercise["update-target" "Use the Design Recipe to write a function " @code{update-target} ", which takes in the target's x-coordinate and produces the next x-coordinate, which is 50 pixels to the right. "]

@;@worksheet{
@;Use the Design Recipe to write a function update-target, which takes in the target's x-coordinate and produces the next x-coordinate, which is 50 pixels to the right. 

@;@worksheet-segment{I. Contract + Purpose Statement}
@;Every contract has three parts:
@;@contract-exercise["21" #:name "update-target" #:domain "number" #:range "number"]
@;;@fill-in-the-blank[#:id "purpose1" #:label "Purpose" #:answer "Takes in the target's current x-coordinate and adds 50 to it"]

@;@worksheet-segment{II. Give Examples}
@;On the computer, write an example of your function in action, using EXAMPLE.

@;@example-with-text[#:text1 "use the function here"
@;                   #:text2 "find another way to get the same result here"
@;                   "update-target-1"
@;                   #:example1 "update-target 60"
@;                   #:example2 "(+ 60 50)"]
@;@example-with-text[#:text1 "use the function here"
@;                   #:text2 "find another way to get the same result here"
@;                   "update-target-2"
@;                   #:example1 "update-target 125"
@;                   #:example2 "(+ 125 50)"]

@;@worksheet-segment{III. Function Header}
@;Write the Function Header, giving variable names to all your input values.
@;@function-exercise["update-target" #:name "update-target" #:args "target-x" #:body "(+ target-x 50)"]}
