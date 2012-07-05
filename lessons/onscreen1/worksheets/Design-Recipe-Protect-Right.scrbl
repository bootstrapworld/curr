#lang curr/lib

@section{Design Recipe: protect-right?}
@worksheet{
    Use the Design Recipe to write a function protect-right?, which takes in the target's x-coordinate and checks to see if it is less than 690.
    
    1.  Contract + Purpose Statement @linebreak[]
    Every contract has three parts:
    
    @contract-exercise["31" #:name "protect-right" #:domain "number" #:range "boolean"]

    What does this function do? @linebreak[]
    @free-response[#:id "what does the function do?" #:answer "takes in the x-coordinate and checks if it is less than 690"]
    
    2. Give Examples @linebreak[]    
    Write two examples of your function in action
    
    @example-with-text[#:text1 "use the function here"
                   #:text2 "find another way to get the same result here"
                   "protect-right-1"
                   #:example1 "protect-right 350"
                   #:example2 "(< 350 690)"]

    @example-with-text[#:text1 "use the function here"
                   #:text2 "find another way to get the same result here"
                   "protect-right-2"
                   #:example1 "protect-right 900"
                   #:example2 "(< 900 690)"]
                   
    3. Function Header @linebreak[]
    Write the function Header, giving variable names to all your input values.
    
    @function-exercise["protect-right?" #:name "protect-right" #:args "x" #:body "(< x 690)"]}