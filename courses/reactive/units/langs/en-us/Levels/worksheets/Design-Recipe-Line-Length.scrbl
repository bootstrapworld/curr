#lang curr/lib

@title{Design Recipe: line-length}
@worksheet{
   Write a function called line-length, which takes in two numbers and returns the difference between them. It should always subtract the smaller number from the bigger one.

    @worksheet-segment{I.  Contract + Purpose Statement}
    Every contract has three parts:
    
    @contract-exercise["line-length.1" #:name "line-length" #:domain "number number" #:range "number"]
    
    @worksheet-segment{II. Give Examples}
    Write two examples of your function in action
   
     @example-with-text[#:text1 "use the function here"
                   #:text2 "find another way to get the same result here"
                   "1D-1"
                   #:example1 "line-length 10 5"
                   #:example2 "(- 10 5)"] 
 @example-with-text[#:text1 "use the function here"
                   #:text2 "find another way to get the same result here"
                   "1D-2"
                   #:example1 "line-length 2 8"
                   #:example2 "(- 8 2)"]
    
    
    @worksheet-segment{III. Function Header}
    Write the function Header, giving variable names to all your input values.
    
    (define (@fill-in-the-blank[#:id "line-length1" #:label "function name" #:answer "line-length"] @fill-in-the-blank[#:id "line-length2" #:label "variable names" #:answer "a b"])
    
    (cond
    
    @fill-in-the-blank[#:id "ll10" #:label "Condition1" #:answer "(> a b)"]@fill-in-the-blank[#:id "ll11" #:label "Answer1" #:answer "(- a b)"]
    
        @fill-in-the-blank[#:id "ll12" #:label "Condition2" #:answer "else"]@fill-in-the-blank[#:id "ll13" #:label "Answer2" #:answer "(- b a)"]
    
        @fill-in-the-blank[#:id "ll14" #:label "Condition3"]@fill-in-the-blank[#:id "ll15" #:label "Answer3"]
    
        @fill-in-the-blank[#:id "ll16" #:label "Condition4"]@fill-in-the-blank[#:id "ll17" #:label "Answer4"]
    
        @fill-in-the-blank[#:id "ll18" #:label "Condition3"]@fill-in-the-blank[#:id "ll19" #:label "Answer5"]))
        }
