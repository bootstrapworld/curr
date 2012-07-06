#lang curr/lib

@title{Design Recipe: update-danger}

@worksheet{

Use the Design Recipe to write a function update-danger, which takes in the danger's x-coordinate and produces the next x-coordinate, which is 50 pixels to the left. 

@worksheet-segment{I. Contract + Purpose Statement}
Every contract has three parts: @linebreak[]
@contract-exercise["11" #:name "update-danger" #:domain "number" #:range "number"] @linebreak[]
;@fill-in-the-blank[#:id "purpose1" #:label "Purpose" #:answer "Takes in danger's current x-coordinate and adds 50 to it"]

@worksheet-segment{II. Give Examples}
On the computer, write an example of your function in action, using EXAMPLE.

@example-with-text[#:text1 "use the function here"
                   #:text2 "find another way to get the same result here"
                   "update-danger-1"
                   #:example1 "update-danger 500"
                   #:example2 "(+ 500 50)"]@linebreak[]
@example-with-text[#:text1 "use the function here"
                   #:text2 "find another way to get the same result here"
                   "update-danger-2"
                   #:example1 "update-danger 140"
                   #:example2 "(+ 140 50)"]

@worksheet-segment{III. Function Header}
Write the Function Header, giving variable names ot all your input values.

@function-exercise["update-danger" #:name "update-danger" #:args "danger-x" #:body "(+ danger-x 50)"]
}


