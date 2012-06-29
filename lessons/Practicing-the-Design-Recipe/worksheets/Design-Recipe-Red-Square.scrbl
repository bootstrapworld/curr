#lang curr/lib
@title{Design Recipe: Red-Square}

@worksheet{
Use the Design Recipe to write a function @code{red-square}, which takes in a number (the size of the square) and outputs a solid red rectangle whose length and width are the same size.
    
    1.  Contract + Purpose Statement
    @linebreak[]
    Every contract has three parts:
    
    @(contract-exercise "21")
    
    What does this function do?
    @linebreak[]
    @free-response[#:id "what does the function do?"]
    
    2. Give Examples
    @linebreak[]
    Write two examples of your function in action
    @linebreak[]
    @example-with-text[#:text1 "red-square size"
                   #:text2 "shape"
                   "red-square-1"]
    @example-with-text[#:text1 "red-square size"
                   #:text2 "shape"
                   "red-square-2"]
    
    3. Function Header
    @linebreak[]
    Write the function Header, giving variable names to all your input values.
    @;linebreak[]
    @function-exercise["red-square"]}