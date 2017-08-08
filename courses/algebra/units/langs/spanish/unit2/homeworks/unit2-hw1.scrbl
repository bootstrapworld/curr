#lang curr/lib

@title{Unit Two Homework}

@lesson/studteach[#:title "Question One:"]{@bold{A)} Write the contract for a function called @bold{star25} that takes in a string representing a color, and returns a solid star of that color with a size of 25 pixels.
                                  
                                  @(contract-exercise "c1")

                                 @bold{B)} If 1/4 cup of coffee beans can make one cup of coffee, write the contract for a function called @bold{cuppa-joe}, which takes in the amount of beans (in cups) put into a coffee maker and gives you the number of cups of coffee that amount of beans will produce.
                                 
                                 @(contract-exercise "c2")
                                 
                                 @bitmap{images/coffee-cup.png}}

@lesson/studteach[#:title "Question Two:"]{Explain the difference between @code{33} and @code{"33"}
                                
                                 @fill-in-the-blank[#:id "string1"]}                              

@lesson/studteach[#:title "Question Three:"]{Is the string "red" an example of a domain or an input? Why?
                                  
                                   @fill-in-the-blank[#:id "string2"]}

@lesson/studteach[#:title "Question Four:"]{@itemlist/splicing[@item{Your school is starting an archery club, and would like you to create a sketch of their archery targets in Racket.}
                   @item{@bold{A)} Underneath the given circles(c1 and c2), define two more circles of your own.} 
@item{@bold{B)} Using the @bold{overlay} function, place your final circle (c4) on top of the image already defined to create your own image of an archery target. A typical target looks like this:}]                              
                                  @bitmap{images/archerysmall.png}
@embedded-wescheme[#:id "archery"
                   #:public-id "5sXchyGJ9h"
                   #:width "70%"]}

@lesson/studteach[#:title "Bonus!"]{How would you add the thin circles which separate the sections of the target? Try adding them to your image! }