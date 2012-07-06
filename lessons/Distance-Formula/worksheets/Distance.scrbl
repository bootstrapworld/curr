#lang curr/lib

@title{Distance}
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
    
    @worksheet-segment{I.  Contract + Purpose Statement}
    @contract-exercise["distance-1" #:name "distance" #:domain "number number number number" #:range "number"] @linebreak[]
    ;@fill-in-the-blank[#:id "distance-2" #:label "Purpose" #:answer "Takes in player x and player y, character x and character y, and gives distance between them"]
    
    @worksheet-segment{II. Give Examples}
    Write two examples of your function in action @linebreak[]
    @example-with-text["distance-3" #:example1 "distance 100 200 300 400"
                                    #:example2 "(sqrt (+ (sq (line-length 100 300))(sq (line-length 200 400))))"] @linebreak[]
    @example-with-text["distance-4" #:example1 "distance 300 200 400 500"
                                    #:example2 "(sqrt (+ (sq (line-length 300 400) ) (sq (line-length 200 500))))"]
    
    @worksheet-segment{III. Function Header}
    @function-exercise["distance-5" #:name "distance" #:args "px py cx cy" #:body "(sqrt (+ (sq (line-length px cx ) (sq (line-length py cy)))))"]}
