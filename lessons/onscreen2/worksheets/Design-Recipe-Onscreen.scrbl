#lang curr/lib
@title{Design Recipe: onscreen?}
@worksheet{
    Use the Design Recipe to write a function onscreen?, which takes in the target's x-coordinate and checks to see Sam is protected on the left and protected on the right
    
    1.  Contract + Purpose Statement@linebreak[]
     Every contract has three parts:
    
    @contract-exercise["51" #:name "onscreen?" #:domain "number" #:range "boolean"]

    What does this function do?@linebreak[]
    @free-response[#:id "what does the function do?" #:answer "Takes in the x-coordinate and checks if target is protected on the left and the right"]
    
    2. Give Examples@linebreak[]
    Write two examples of your function in action
    
    @example-with-text[#:text1 "use the function here"
                   #:text2 "find another way to get the same result here"
                   "onscreen-1"
                   #:example1 "onscreen? 900"
                   #:example2 "(and (protect-left 900) (protect-right 900))"]

    @example-with-text[#:text1 "use the function here"
                   #:text2 "find another way to get the same result here"
                   "onscreen-2"
                   #:example1 "onscreen? 355"
                   #:example2 "(and (protect-left 355) (protect-right 355))"]
                   
    3. Function Header@linebreak[]
    Write the function Header, giving variable names to all your input values.
    
    @function-exercise["onscreen?" #:name "onscreen?" #:args "x" #:body "(and (protect-left x) (protect-right x))"]}