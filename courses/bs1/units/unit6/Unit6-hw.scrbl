#lang curr/lib

@title{Unit Six Homework}

@lesson[#:title "Question One:"]{@itemlist/splicing[@item{There are mistakes in the following code! See if you can spot them, and correct the code so that it runs!}

@item{@bitmap{images/B1.png}}
@item{@fill-in-the-blank[#:id "bug1"]}

@item{@bitmap{images/B2.png}}
@item{@fill-in-the-blank[#:id "bug2"]}

@item{@bitmap{images/B4.png}}
@item{@fill-in-the-blank[#:id "bug4"]}
                                                
@item{@bitmap{images/B3.png}}
@item{@fill-in-the-blank[#:id "bug3"]}

@item{@bitmap{images/B5.png}}
@item{@fill-in-the-blank[#:id "bug5"]}]}

@lesson[#:title "Question Two:"]{
@bitmap{images/light.png}
@design-recipe-exercise["drive?" "When driving a car, it is only legal to drive through an intersection when the stoplight is green or yellow. Write the function drive? which takes in a color (represented by a string), and returns true if that color is either green OR yellow."]}

@lesson[#:title "Question Three:"]{                             
@design-recipe-exercise["just-right" "You have just finished making a delicious pot of soup, and wish to serve it to your friends. However, if your soup is served at room temperature (70 degrees) or colder, it will be too cold, and if it is served too hot (more than 160 degrees) it may burn your friends when they try to eat it! Write the function just-right, which takes in the temperature of your pot of soup, and returns true if it is safe to eat (i.e. between room temperature and 160 degrees)"]
@bitmap{images/soup.jpg}}

@lesson[#:title "Bonus!"]{Will this function evaluate to true or false? Why?
                          @code["(= 45 (random 50))"]}
@free-response[#:id "fr1"]