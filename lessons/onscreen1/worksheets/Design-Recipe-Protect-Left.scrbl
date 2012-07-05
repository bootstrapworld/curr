#lang curr/lib

@title{Design Recipe: protect-left?}
@worksheet{
    Use the Design Recipe to write a function protect-left?, which takes in the target's x-coordinate and checks to see if it is greater than -50
    
    1.  Contract + Purpose Statement@linebreak[]
    Every contract has three parts:
    
    @contract-exercise["21" #:name "protect-left" #:domain "number" #:range "boolean"]

    What does this function do?@linebreak[]
    @free-response[#:id "what does the function do?" #:answer "Takes in the x-coordinate and checks if it's greater than -50"]
    
    2. Give Examples @linebreak[]
    Write two examples of your function in action
    
    @example-with-text[#:text1 "use the function here"
                   #:text2 "find another way to get the same result here"
                   "protect-left-1"
                   #:example1 "protect-left 20"
                   #:example2 "(> 20 -5)"]

    @example-with-text[#:text1 "use the function here"
                   #:text2 "find another way to get the same result here"
                   "protect-left-2"
                   #:example1 "protect-left -200"
                   #:example2 "(> -200 -5)"]
                   
    3. Function Header@linebreak[]
    Write the function Header, giving variable names to all your input values.
    
    @function-exercise["protect-left?" #:name "protect-left" #:args "x" #:body "(> x 50)"]}

