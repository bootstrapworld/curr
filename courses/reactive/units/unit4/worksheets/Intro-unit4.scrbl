#lang curr/lib
@title{Review: define-struct}

@worksheet{Last week we talked about a function that created new structs. For the structs below, what function would you use for each of the following?
           
@exercise{@code{; an auto is a String }@fill-in-the-blank[#:id "auto-1"] @code{Number} @fill-in-the-blank[#:id "auto-2"]  @code{Number}
           
           @code{(define-struct auto (model hp rims color value))}

           Make an auto? @fill-in-the-blank[#:id "make-auto"]
           
           Get the model out of the auto? @fill-in-the-blank[#:id "auto-model"]
           
           Get the hp out of the auto? @fill-in-the-blank[#:id "auto-hp"]}

@exercise{@code{; a party is a} @fill-in-the-blank[#:id "String"] @code{String Number}
                        
          @code{(define-struct party (theme location guests))}
          
          Make a party? @fill-in-the-blank[#:id "make-party"]
          
          Get the theme out of the party? @fill-in-the-blank[#:id "party-theme"]
          
          Get the location out of the party? @fill-in-the-blank[#:id "party-loc"]
          
          Get the guests out of the party? @fill-in-the-blank[#:id "party-guests"]}

@exercise{@code{; a world is a Number}
          
          @code{(define-struct world (dogX))}
          
          Make a world? @fill-in-the-blank[#:id "make-world"]
          
          Get the dogX out of the world? @fill-in-the-blank[#:id "world-dogX"]} 
}