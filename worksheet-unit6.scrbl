#lang scribble/base
@(require "../lib/all.rkt")
@title{Unit 6 Worksheet}

@section{Protecting Sam}
@worksheet{
  Sam is in a 640 x 480 yard.  How far can he go to the left and right before he's out of sight?
  
  1. A piece of Sam is still visible on the left as long as...  (> x -50)
  
  
  2. A piece of Sam is still visible on the right as long as... @fill-in-the-blank[#:id ""]
  
  
  3. Draw the Circle of Evaluation for those two expressions.
  }



@section{Design Recipe: protect-left?}
@worksheet{
    Use the Design Recipe to write a function protect-left?, which takes in the target's x-coordinate and checks to see if it is greater than -50
    
    1.  Contract+ Purpose Statement
    Every contract has three parts:
    
    ;@fill-in-the-blank[#:id "name"]:@fill-in-the-blank[#:id "Domain"] -> @fill-in-the-blank[#:id "Range"]
    ;@fill-in-the-blank[#:id "what does the function do?"]
    
    2. Give Examples
    Write two examples of your function in action
    @fill-in-the-blank[#:id "Example 1"]
    @fill-in-the-blank[#:id "Example 2"]
    
    3. Function Header
    Write the function Header, giving variable names to all your input values.
    (define (@fill-in-the-blank[#:id "function name"] @fill-in-the-blank[#:id "variable names"])
    @fill-in-the-blank[#:id "what it does"])}

@section{Design Recipe: protect-right?}
@worksheet{
    Use the Design Recipe to write a function protect-right?, which takes in the target's x-coordinate and checks to see if it is less than 690
    
    1.  Contract+ Purpose Statement
    Every contract has three parts:
    
    ;@fill-in-the-blank[#:id "name"]:@fill-in-the-blank[#:id "Domain"] -> @fill-in-the-blank[#:id "Range"]
    ;@fill-in-the-blank[#:id "what does the function do?"]
    
    2. Give Examples
    Write two examples of your function in action
    @fill-in-the-blank[#:id "Example 1"]
    @fill-in-the-blank[#:id "Example 2"]
    
    3. Function Header
    Write the function Header, giving variable names to all your input values.
    (define (@fill-in-the-blank[#:id "function name"] @fill-in-the-blank[#:id "variable names"])
    @fill-in-the-blank[#:id "what it does"])}

@section{AND and OR}
@worksheet{
           Write the Circle of Evaluation for the following statements and their racket code.
           
           1. Two is less than five and zero is equal to six
           @fill-in-the-blank[#:id "Racket Code"]
           
           
           2. Two is less than four or four is equal to six
           @fill-in-the-blank[#:id "Racket Code"]}

@section{Design Recipe: onscreen?}
@worksheet{
    Use the Design Recipe to write a function onscreen?, which takes in the target's x-coordinate and checks to see Sam is protected on the left and protected on the right
    
    1.  Contract+ Purpose Statement
    Every contract has three parts:
    
    ;@fill-in-the-blank[#:id "name"]:@fill-in-the-blank[#:id "Domain"] -> @fill-in-the-blank[#:id "Range"]
    ;@fill-in-the-blank[#:id "what does the function do?"]
    
    2. Give Examples
    Write two examples of your function in action
    @fill-in-the-blank[#:id "Example 1"]
    @fill-in-the-blank[#:id "Example 2"]
    
    3. Function Header
    Write the function Header, giving variable names to all your input values.
    (define (@fill-in-the-blank[#:id "function name"] @fill-in-the-blank[#:id "variable names"])
    @fill-in-the-blank[#:id "what it does"])}