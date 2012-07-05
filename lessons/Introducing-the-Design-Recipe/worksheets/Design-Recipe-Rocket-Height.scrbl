#lang curr/lib
@title{Design Recipe: Rocket-Height}

@worksheet{
   A rocket blasts off, traveling at 7 meters per second. Write a function called @code{rocket-height} that takes in the number of seconds that have passed since the rocket took off, and which produces the height of the rocket at that time.

    1.  Contract + Purpose Statement
    @linebreak[]
    Every contract has three parts:
    
    @contract-exercise["11" #:name "rocket-height" #:domain "number" #:range "number"]
    ;@fill-in-the-blank[#:id "12" #:label "purpose" #:answer "Takes the number of seconds passed since take-off, and produces the current height"]
    
    2. Give Examples
    @linebreak[]
    Write two examples of your function in action

    @example-with-text[#:text1 "rocket-height seconds"
                   #:text2 "height"
                   "rocket-height-1" 
                   #:example1 "rocket-height 0"
                   #:example2 "(* 7 0)"]

    @example-with-text[#:text1 "rocket-height seconds"
                   #:text2 "height"
                   "rocket-height-2"
                   #:example1 "rocket-height 4"
                   #:example2 "(* 7 4)"]
    
    3. Function Header
    @linebreak[]
    Write the function Header, giving variable names to all your input values.

    @function-exercise["rocket-height"
                       #:name "rocket-height"
                       #:args "time"
                       #:body "(* 7 time)"]}