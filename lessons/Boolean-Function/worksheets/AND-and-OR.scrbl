#lang curr/lib

@title{AND and OR}
@worksheet{
           Write the Circle of Evaluation for the following statements and their racket code.
           
           1. Two is less than five and zero is equal to six
           
           @;bitmap{images/circle1.png}
           
           @fill-in-the-blank[#:id "Racket Code" #:answer "(and (< 2 5) (= 0 6))"]
           
           
           2. Two is less than four or four is equal to six

           @;bitmap{images/circle2.png}

           @fill-in-the-blank[#:id "Racket Code" #:answer "(or (< 2 4) (= 4 6))"]}
