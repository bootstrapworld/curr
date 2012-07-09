#lang curr/lib


@design-recipe-exercise["red-square" "Use the Design Recipe to write a function " @code{red-square} ", which takes in a number (the size of the square) and outputs a solid red rectangle whose length and width are the same size."]

@;worksheet{
@;Use the Design Recipe to write a function @code{red-square}, which takes in a number (the size of the square) and outputs a solid red rectangle whose length and width are the same size.
    
    @;worksheet-segment{I. Contract + Purpose Statement}
    @;Every contract has three parts:
    
    @;contract-exercise["21" #:name "red-square" #:domain "number" #:range "image"]

    @;@fill-in-the-blank[#:id "what does the function do?" #:label "Purpose" #:answer "Draws a solid red square of the size given"]
    
    @;worksheet-segment{II. Give Examples}
    @;Write two examples of your function in action
    
    @;example-with-text["red-square-1"
      @;             #:example1 "red-square 5"
       @;            #:example2 "(rectangle 5 5 \"solid\" \"red\")"]
    @;example-with-text["red-square-2"
      @;             #:example1 "red-square 6"
       @;            #:example2 "(rectangle 6 6 \"solid\" \"red\")"]
    
    @;worksheet-segment{III. Function Header}
    @;Write the function Header, giving variable names to all your input values. 
    @;function-exercise["red-square" #:name "red-square" #:args "size" #:body "(rectangle size size \"solid\" \"red\")"]}