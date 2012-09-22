#lang curr/lib

@title{Dissecting a Demo: Ninja World}
@worksheet{
           @exercise{
                     What changes? 
                     
                     @free-response[#:id "What changes?"] }
            
            @exercise{
                                   
                     ; a world is a @fill-in-the-blank[#:id "world is a"]         
                     
                     (define-struct world @fill-in-the-blank[#:id "define-struct"] ) 
                     
                     My constructor function is: @fill-in-the-blank[#:id "make-world" #:columns 80 #:label "How do you make a world?"]
                     
                     What is its contract? @contract-exercise["ds"]
                     
                     My accessor function is: @fill-in-the-blank[#:id "world-dogX" #:columns 80 #:label "How do you get the dogX out of the world?"]
                     
                     What is its contract? @contract-exercise["wd"]
                     
                     }}