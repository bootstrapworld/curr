#lang curr/lib

@section{Design Recipe: protect-right?}
@worksheet{
    Use the Design Recipe to write a function protect-right?, which takes in the target's x-coordinate and checks to see if it is less than 690
    
    1.  Contract+ Purpose Statement
    
    Every contract has three parts:
    
    @(contract-exercise "31")

    ;@fill-in-the-blank[#:id "what does the function do?"]
    
    2. Give Examples
    
    Write two examples of your function in action
    
    @example-with-text[#:text1 "use the function here"
                   #:text2 "find another way to get the same result here"
                   "protect-right-1"]

    @example-with-text[#:text1 "use the function here"
                   #:text2 "find another way to get the same result here"
                   "protect-right-2"]
                   
    3. Function Header
    
    Write the function Header, giving variable names to all your input values.
    
    @function-exercise["protect-right?"]}