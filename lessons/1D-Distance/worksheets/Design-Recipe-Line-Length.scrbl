#lang curr/lib

@title{Design Recipe: line-length}
@worksheet{
   Write a function called line-length, which takes in two numbers and returns the difference between them. It should always subtract the smaller number from the bigger one.

    1.  Contract + Purpose Statement@linebreak[]
    Every contract has three parts:
    
    @(contract-exercise "line-length.1")
    
    2. Give Examples@linebreak[]
    Write two examples of your function in action
   
     @example-with-text[#:text1 "use the function here"
                   #:text2 "find another way to get the same result here"
                   "1D-1"]
 @example-with-text[#:text1 "use the function here"
                   #:text2 "find another way to get the same result here"
                   "1D-2"]
    
    
    3. Function Header@linebreak[]
    Write the function Header, giving variable names to all your input values.
    
    @function-exercise["line-length"]
    (define (@fill-in-the-blank[#:id "line-length1" #:label "function name"] @fill-in-the-blank[#:id "line-length2" #:label "variable names"]) @linebreak[]
    (cond
    @(worksheet-table '() '() (list "cond" "result") 2 6) ))}
