#lang curr/lib
@title{collide}
@worksheet{
@design-recipe-exercise["collide?" 
                        "Write a function " @code{collide?} ", which takes in FOUR inputs: " @code{px} " the x-coordinate of the player; " @code{py} " the y-coordinate of the player; " @code{cx} " the x-coordinate of another game character; " @code{cy} " the y-coordinate of another game character. It should return " @code{true} " if the coordinates of the player are within 75 pixels of the coordinates of the other character. Otherwise, " @code{false} "."]
}
@;@worksheet{
@;Write a function collide?, which takes FOUR inputs:
@;@itemlist[
@;@item{px: The x-coordinate of the player}
@;@item{py: The y-coordinate of the player}
@;@item{cx: The x-coordinate of another game character}
@;@item{cy: The y-coordinate of another game character}
@;]
@;It should return @code{true} if the coordinates of the player are within 75 pixels of the
@;coordinates of the other character. Otherwise, @code{false}.
    
@;    @worksheet-segment{I.  Contract + Purpose Statement}    
@;    @contract-exercise["collision-1" #:name "collide?" #:domain "number number number number" #:range "boolean"] 
@;    ;@fill-in-the-blank[#:id "collision-2" #:label "Purpose" #:answer "Takes player-x, player-y, character-x, character-y and returns true if characters are colliding"]
    
@;    @worksheet-segment{II. Give Examples}
@;    Write two examples of your function in action
@;    @example-with-text["collision-3" #:example1 "collide? 100 200 300 400" #:example2 "(< (distance 100 200 300 400) 75)"]
@;    @example-with-text["collision-4" #:example1 "collide? 300 500 200 400" #:example2 "(< (distance 300 500 200 400) 75)"]
    
@;    @worksheet-segment{III. Function Header}
@;    @function-exercise["collision-5" #:name "collide?" #:args "px py cx cy" #:body "(< (distance px py cx cy) 75)"]}
