#lang curr/lib

@title{Unit Six Homework}

@lesson[#:title "Question One:"]{There are mistakes in the following code! See if you ca spot them, and the write the correct code (in its entirety) below.}
@itemlist/splicing[@item{@code[(string= “bicycle” “bicycle”)]}
                    @fill-in-the-blank[#:id "bug1"]
                    
                   @item{@code[;squared: number -> number
                               ;squares a number (multiplies it by itself)
                               (EXAMPLE (squared 4)
                               (* 2 4))]}
                   @fill-in-the-blank[#:id "bug2.1"]
                   @fill-in-the-blank[#:id "bug2.2"]
                   
                   @item{@code[((= 7 7) and (> 19 3))]}
                   @fill-in-the-blank[#:id "bug3"]
                   
                   @item{@code[(+ “hello” “world”)]}
                   @fill-in-the-blank[#:id "bug4"]
                   
                   @item{@code[;change-triangle-color: string->image
                               ;produces a triangle of the color indicated
                               (define (change-triangle-color c)
                               (triangle 20 “solid” “c”))]}
                   @fill-in-the-blank[#:id "bug5.1"]
                   @fill-in-the-blank[#:id "bug5.2"]]

@lesson[#:title "Question Two:"]{When driving a car, it is only legal to drive through an intersection when the stoplight is green or yellow. Write the function drive? which takes in a color (represented by a string), and returns true if that color is either green OR yellow.}
@bitmap{images/light.png}
@include-lesson["design-rec.scrbl"]

@lesson[#:title "Question Three:"]{You have just finished making a delicious pot of soup, and wish to serve it to your friends. However, if your soup is served at room temperature (70 degrees) or colder, it will be too cold, and if it is served too hot (more than 160 degrees) it may burn your friends when they try to eat it! Write the function just-right, which takes in the temperature of your pot of soup, and returns true if it is safe to eat (i.e. between room temperature and 160 degrees)}                             
@include-lesson["design-rec.scrbl"]
@bitmap{images/soup.jpg}

@lesson[#:title "Bonus!"]{Will this function evaluate to true or false? Why?
                          @code[(= 45 (random 50))]}
@free-response[#:id "fr1"]