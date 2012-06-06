#lang scribble/base
@(require "lib/all.rkt")

@declare-tags[group pedagogy selftaught bootstrap]


@section{Design Recipe: line-length}
@worksheet{
   Write a function called line-length, which takes in two numbers and returns the difference between them. It should always subtract the smaller number from the bigger one.

    1.  Contract+ Purpose Statement
    Every contract has three parts:
    
    ;@fill-in-the-blank[#:id "name"]:@fill-in-the-blank[#:id "Domain"] -> @fill-in-the-blank[#:id "Range"]
    
    2. Give Examples
    Write two examples of your function in action
   
    (Example (line-length 10 5) (- 10 5) )
    
    (Example (line-length 2 8 ) (- 8 2)  )
    
    
    3. Function Header
    Write the function Header, giving variable names to all your input values.
    (define (@fill-in-the-blank[#:id "function name"] @fill-in-the-blank[#:id "variable names"])
    @fill-in-the-blank[#:id "what it does"])
    
    INSERT TABLE}

@section{The Distance Formula, with Numbers}
@worksheet{
     The distance between the points (4, 0) and (0, 3) is given by:
     
     INSERT IMAGE FORMULA HERE
     
     Now convert it into a Circle of Evaluation. (We've already gotten you started!)
     
     INSERT CIRCLE IMAGE HERE
     
     Convert it into Racket code:
     
     @free-response[#:id "code"]
     
     }

@section{Distance}
@worksheet{
Write a function distance,which takes FOUR inputs:
@itemlist[
@item{px: The x-coordinate of the player}
@item{py: The y-coordinate of the player}
@item{cx: The x-coordinate of another game character}
@item{cy: The y-coordinate of another game character}
]
It should return the distance between the two, using the Distance formula:
 Distance = ((line-length px cx)^2 + (line-length py cy)^2 )
    
    1.  Contract+ Purpose Statement
    ;@fill-in-the-blank[#:id "name"]:@fill-in-the-blank[#:id "Domain"] -> @fill-in-the-blank[#:id "Range"]
    ;@fill-in-the-blank[#:id "what does the function do?"]
    
    2. Give Examples
    Write two examples of your function in action
    @fill-in-the-blank[#:id "Example 1"]
    @fill-in-the-blank[#:id "Example 2"]
    
    3. Function Header
    (define (@fill-in-the-blank[#:id "function name"] @fill-in-the-blank[#:id "variable names"])
    @fill-in-the-blank[#:id "...and the computer does this"])}

@section{Collide}
@worksheet{
Write a function collide?,which takes FOUR inputs:
@itemlist[
@item{px: The x-coordinate of the player}
@item{py: The y-coordinate of the player}
@item{cx: The x-coordinate of another game character}
@item{cy: The y-coordinate of another game character}
]
It should return @code{true} if the coordinates of the player are within 75 pixels of the
coordinates of the other character. Otherwise, @code{false}.
    
    1.  Contract+ Purpose Statement    
    ;@fill-in-the-blank[#:id "name"]:@fill-in-the-blank[#:id "Domain"] -> @fill-in-the-blank[#:id "Range"]
    ;@fill-in-the-blank[#:id "what does the function do?"]
    
    2. Give Examples
    Write two examples of your function in action
    @fill-in-the-blank[#:id "Example 1"]
    @fill-in-the-blank[#:id "Example 2"]
    
    3. Function Header
    (define (@fill-in-the-blank[#:id "function name"] @fill-in-the-blank[#:id "variable names"])
    @fill-in-the-blank[#:id "...and the computer does this"])}