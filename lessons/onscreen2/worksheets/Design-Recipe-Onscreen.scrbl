#lang curr/lib

@design-recipe-exercise["onscreen?" "Use the Design Recipe to write a function " @code{onscreen?} ", which takes in the target's x-coordinate and checks to see Sam is protected on the left and protected on the right."]

@;@worksheet{
@;    Use the Design Recipe to write a function onscreen?, which takes in the target's x-coordinate and checks to see Sam is protected on the left and protected on the right
    
@;    @worksheet-segment{I.  Contract + Purpose Statement}
@;     Every contract has three parts:
    
@;    @contract-exercise["51" #:name "onscreen?" #:domain "number" #:range "boolean"] 
@;    ;@fill-in-the-blank[#:id "what does the function do?" #:label "Purpose" #:answer "Takes in the x-coordinate and checks if target is protected on the left and the right"]
    
@;    @worksheet-segment{II. Give Examples}
@;    Write two examples of your function in action
    
@;    @example-with-text[#:text1 "use the function here"
@;                   #:text2 "find another way to get the same result here"
@;                   "onscreen-1"
@;                   #:example1 "onscreen? 900"
@;                   #:example2 "(and (protect-left 900) (protect-right 900))"] 
@;    @example-with-text[#:text1 "use the function here"
@;                   #:text2 "find another way to get the same result here"
@;                   "onscreen-2"
@;                   #:example1 "onscreen? 355"
@;                   #:example2 "(and (protect-left 355) (protect-right 355))"]
                   
@;    @worksheet-segment{III. Function Header}
@;    Write the function Header, giving variable names to all your input values.
@;    @function-exercise["onscreen?" #:name "onscreen?" #:args "x" #:body "(and (protect-left x) (protect-right x))"]}