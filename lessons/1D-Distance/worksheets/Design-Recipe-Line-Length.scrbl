#lang curr/lib

@title{Design Recipe: line-length}
@worksheet{
   Write a function called line-length, which takes in two numbers and returns the difference between them. It should always subtract the smaller number from the bigger one.

    1.  Contract+ Purpose Statement
    Every contract has three parts:
    
    ;@fill-in-the-blank[#:id "name"]:@fill-in-the-blank[#:id "Domain"] -> @fill-in-the-blank[#:id "Range"]
    
    2. Give Examples
    Write two examples of your function in action
   
    (Example (line-length 10 5) (- 10 5) )
    
    (Example (line-length 2 8 ) (- 8 2)  )
    
    
    3. Function Header
    Write the function Header, giving variable names to all your input values.
    (define (@fill-in-the-blank[#:id "function name"] @fill-in-the-blank[#:id "variable names"])
    @fill-in-the-blank[#:id "what it does"])
    
    INSERT TABLE}