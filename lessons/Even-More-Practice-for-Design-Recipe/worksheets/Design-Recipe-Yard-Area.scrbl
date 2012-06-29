#lang curr/lib
@title{Design Recipe: Yard-Area}

@worksheet{
Use the Design Recipe to write a function yard-area, which takes in the width and length of a yard, and returns the area of the yard.
(Don’t forget: area = length * width !)
    
    1.  Contract+ Purpose Statement
    
    Every contract has three parts:
    
    @(contract-exercise "31")
    ;@fill-in-the-blank[#:id "what does the function do?"]
    
    2. Give Examples
    
    Write two examples of your function in action
    
     @example-with-text[#:text1 "yard-area width length"
                   #:text2 "area"
                   "yard-area-1"]
    @example-with-text[#:text1 "yard-area width length"
                   #:text2 "area"
                   "yard-area-2"]
    
    3. Function Header
    
    Write the function Header, giving variable names to all your input values.
    
    @function-exercise["yard-area"]}