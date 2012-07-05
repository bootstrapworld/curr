#lang curr/lib
@title{Design Recipe: Red-Square}

@worksheet{
Use the Design Recipe to write a function @code{red-square}, which takes in a number (the size of the square) and outputs a solid red rectangle whose length and width are the same size.
    
    1.  Contract + Purpose Statement
    @linebreak[]
    Every contract has three parts:
    
    @contract-exercise["21" #:name "red-square" #:domain "number" #:range "image"]
    
    What does this function do?
    @linebreak[]
    @free-response[#:id "what does the function do?" #:answer "Draws a solid red square of the size given"]
    
    2. Give Examples
    @linebreak[]
    Write two examples of your function in action
    @linebreak[]
    @example-with-text[#:text1 "red-square size"
                   #:text2 "shape"
                   "red-square-1"
                   #:example1 "red-square 5"
                   #:example2 "(rectangle 5 5 \"solid\" \"red\")"]
    @example-with-text[#:text1 "red-square size"
                   #:text2 "shape"
                   "red-square-2"
                   #:example1 "red-square 6"
                   #:example2 "(rectangle 6 6 \"solid\" \"red\")"]
    
    3. Function Header
    @linebreak[]
    Write the function Header, giving variable names to all your input values.
    @;linebreak[]
    @function-exercise["red-square" #:name "red-square" #:args "size" #:body "(rectangle size size \"solid\" \"red\")"]}