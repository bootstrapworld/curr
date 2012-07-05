#lang curr/lib
@title{Design Recipe: Yard-Area}

@worksheet{
Use the Design Recipe to write a function yard-area, which takes in the width and length of a yard, and returns the area of the yard.
(Don’t forget: area = length * width !)
    
    1.  Contract+ Purpose Statement
    
    Every contract has three parts:
    
    @contract-exercise["31" #:name "yard-area" #:domain "number number" #:range "number"]
    ;@fill-in-the-blank[#:id "yard-area-0" #:label "Purpose" #:answer "Takes in the length and width of a yard and gives back its area"]
    
    2. Give Examples
    
    Write two examples of your function in action
    
     @example-with-text[#:text1 "yard-area width length"
                   #:text2 "area"
                   "yard-area-1"
                   #:example1 "yard-area 5 3"
                   #:example2 "(* 5 3)"]
    @example-with-text[#:text1 "yard-area width length"
                   #:text2 "area"
                   "yard-area-2"
                   #:example1 "yard-area 8 2"
                   #:example2 "(* 8 2)"]
    
    3. Function Header
    
    Write the function Header, giving variable names to all your input values.
    
    @function-exercise["yard-area-3" #:name "yard-area" #:args "length width" #:body "(* length width)"]}