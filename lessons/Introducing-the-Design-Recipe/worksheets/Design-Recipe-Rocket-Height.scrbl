#lang curr/lib
@title{Design Recipe: Rocket-Height}

@worksheet{
   A rocket blasts off, traveling at 7 meters per second. Write a function called “rocket-height” that takes in the number of seconds that have passed since the rocket took off, and which produces the height of the rocket at that time.

    1.  Contract+ Purpose Statement
    
    Every contract has three parts:
    
    @(contract-exercise "11")
    @(contract-exercise "12")
    
    @;@fill-in-the-blank[#:id "name"]:@fill-in-the-blank[#:id "Domain"] -> @fill-in-the-blank[#:id "Range"]
    @;@fill-in-the-blank[#:id "what does the function do?"]
    
    2. Give Examples
    
    Write two examples of your function in action

    @example-with-text[#:text1 "rocket-height seconds"
                   #:text2 "height"
                   "rocket-height-1"]
    @example-with-text[#:text1 "rocket-height seconds"
                   #:text2 "height"
                   "rocket-height-2"]
    
    3. Function Header
    
    Write the function Header, giving variable names to all your input values.

    @function-exercise["rocket-height"]}