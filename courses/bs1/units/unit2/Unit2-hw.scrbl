#lang curr/lib

@title{Unit Two Homework}

@lesson[#:title "Question One:"]{@bold{A)} Write the contract for a function called @bold{what-color} that takes in a color, and returns a triangle of that color.
                                  
                                  @(contract-exercise "c1")
                                  
                                 @bold{B)} Write the contract for a function called @bold{shape-border} that takes in a shape, and tells you whether that shape is solid or outlined.
                                 
                                 @(contract-exercise "c2")
                                 
                                 @bold{C)} Write the contract for a function called @bold{cuppa-joe}, which takes in the amount of beans put into a coffee maker and gives you the number of cups of coffee that amount of beans will produce.
                                 
                                 @(contract-exercise "c3")}

@lesson[#:title "Question Two:"]{Explain the difference between @code{33} and @code{"33"}
                                
                                 @fill-in-the-blank[#:id "string1"]}                              

@lesson[#:title "Question Three:"]{Is the string "red" an example of a domain or an input? Why?
                                  
                                   @fill-in-the-blank[#:id "string2"]}

@lesson[#:title "Question Four:"]{@itemlist/splicing[@item{Your school is starting an archery club, and would like you to create a sketch of their archery targets in Racket.}
                   
@item{Using the @bold{overlay} function, place two more circles on top of the ones already defined to create your own image of an archery target. A typical target looks like this:}]                               
                                  @bitmap{images/archerysmall.png}
@embedded-wescheme[#:id "archery"
                   #:public-id "ySDkQEPmh4"
                   #:width "70%"]}

@lesson[#:title "Bonus!"]{How would you add the thin circles which separate the sections of the target? Try adding them to your image! }