#lang curr/lib
@title{Design Recipe: Red-Square}

@worksheet{
Use the Design Recipe to write a function red-square, which takes in a number (the size of the square) and outputs a solid red rectangle whose length and width are the same size.
    
    1.  Contract+ Purpose Statement
    
    Every contract has three parts:
    
    @(contract-exercise "21")
    @fill-in-the-blank[#:id "what does the function do?"]
    
    2. Give Examples
    
    Write two examples of your function in action
    
    @example-with-text[#:text1 "red-square size"
                   #:text2 "shape"
                   "red-square-1"]
    @example-with-text[#:text1 "red-square size"
                   #:text2 "shape"
                   "red-square-2"]
    
    3. Function Header
    
    Write the function Header, giving variable names to all your input values.

    @function-exercise["red-square"]}