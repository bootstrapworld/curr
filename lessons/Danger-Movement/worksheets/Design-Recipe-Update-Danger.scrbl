#lang curr/lib

@title{Design Recipe: update-danger}

@worksheet{

Use the Design Recipe to write a function update-danger, which takes in the danger's x-coordinate and produces the next x-coordinate, which is 50 pixels to the left. 

1.Contract + Purpose Statement @linebreak[]
Every contract has three parts: @linebreak[]
@contract-exercise["11" #:name "update-danger" #:domain "number" #:range "number"]
What does the function do? @linebreak[]
@free-response[#:id "purpose1" #:answer "Takes in danger's current x-coordinate and adds 50 to it"]

2. Give Examples @linebreak[]
On the computer, write an example of your function in action, using EXAMPLE.

@example-with-text[#:text1 "use the function here"
                   #:text2 "find another way to get the same result here"
                   "update-danger-1"
                   #:example1 "update-danger 500"
                   #:example2 "(+ 500 50)"]

@example-with-text[#:text1 "use the function here"
                   #:text2 "find another way to get the same result here"
                   "update-danger-2"
                   #:example1 "update-danger 140"
                   #:example2 "(+ 140 50)"]

3. Function Header @linebreak[]
Write the Function Header, giving variable names ot all your input values.

@function-exercise["update-danger" #:name "update-danger" #:args "danger-x" #:body "(+ danger-x 50)"]
}


