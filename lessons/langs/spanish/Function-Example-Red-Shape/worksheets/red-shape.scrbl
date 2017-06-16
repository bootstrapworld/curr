#lang curr/lib

@title{Design Recipe: red-shape}
@worksheet{
   Write a function called red-shape, which takes in the name of a shape ("circle", "triangle", "star" or "rectangle"), and draws that shape. All shapes should be solid and red, and can be whatever size you choose.

    @worksheet-segment{I.  Contract + Purpose Statement}
    Every contract has three parts:
    
    @contract-exercise["red-shape.1" #:name "red-shape" #:domain "number number" #:range "number"]
    
    @worksheet-segment{II. Give Examples}
    Write two examples of your function in action
   
     @example-with-text[#:text1 "use the function here"
                   #:text2 "find another way to get the same result here"
                   "rs-1"
                   #:example1 "red-shape \"circle\""
                   #:example2 "(circle 50 \"solid\" \"red\")"] 
 @example-with-text[#:text1 "use the function here"
                   #:text2 "find another way to get the same result here"
                   "rs-2"]
  @example-with-text[#:text1 "use the function here"
                   #:text2 "find another way to get the same result here"
                   "rs-3"]
   @example-with-text[#:text1 "use the function here"
                   #:text2 "find another way to get the same result here"
                   "rs-4"]
    
    
    @worksheet-segment{III. Function Header}
    Write the function Header, giving variable names to all your input values.
    
    (define (@fill-in-the-blank[#:id "red-shape1" #:label "function name" #:answer "red-shape"] @fill-in-the-blank[#:id "red-shape2" #:label "variable names" #:answer "a b"])
    
    (cond
    
    @fill-in-the-blank[#:id "rs10" #:label "Condition1" #:answer "(> a b)"]@fill-in-the-blank[#:id "rs11" #:label "Answer1" #:answer "(- a b)"]
    
        @fill-in-the-blank[#:id "rs12" #:label "Condition2" #:answer "else"]@fill-in-the-blank[#:id "rs13" #:label "Answer2" #:answer "(- b a)"]
    
        @fill-in-the-blank[#:id "rs14" #:label "Condition3"]@fill-in-the-blank[#:id "rs15" #:label "Answer3"]
    
        @fill-in-the-blank[#:id "rs16" #:label "Condition4"]@fill-in-the-blank[#:id "rs17" #:label "Answer4"]
    
        @fill-in-the-blank[#:id "ll18" #:label "Condition3"]@fill-in-the-blank[#:id "ll19" #:label "Answer5"]))
        }

