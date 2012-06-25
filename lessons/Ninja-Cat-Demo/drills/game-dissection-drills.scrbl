#lang curr/lib

@drill{
  @itemlist[
    @item{Try out this simple coloring game!}
     @item{List the things in this game. Note: You may not have to use all the blanks provided. @linebreak[]
                                         @fill-in-the-blank[#:id "Games-Drill1"]
                                         @fill-in-the-blank[#:id "Games-Drill2"]
                                         @fill-in-the-blank[#:id "Games-Drill3"]}
     @item{What do each of these things do? @linebreak[]
                                            @fill-in-the-blank[#:id "Games-Drill4"]
                                            @fill-in-the-blank[#:id "Games-Drill5"]
                                            @fill-in-the-blank[#:id "Games-Drill6"]}
     @item{Now play this balloon game.}
     @item{List the things in this game: @linebreak[]
                                         @fill-in-the-blank[#:id "Games-Drill7"]
                                         @fill-in-the-blank[#:id "Games-Drill8"]
                                         @fill-in-the-blank[#:id "Games-Drill9"]}
     @item{What do each of these things do? @linebreak[]
                                            @fill-in-the-blank[#:id "Games-Drill10"]
                                            @fill-in-the-blank[#:id "Games-Drill11"]
                                            @fill-in-the-blank[#:id "Games-Drill12"]}
     @item{Try playing this game, and answer the following questions.}
     @item{What happens in the game constantly? @linebreak[]
                                                @drop-down[#:id "Games-Drill13" #:options (list "Cats fall." "Dogs get bigger." "The frog moves." "Cats and dogs fall." "The background changes color.")]
                                                @check[(constraint:string-eq (value:string "Cats and dogs fall.") (value:form "Contract-Drill13"))]}
     @item{Which things in the game can the player control? @linebreak[]
                                            @drop-down[#:id "Games-Drill14" #:options (list "The size of the frog" "Where the frog goes" "Where the cats and dogs fall" "How fast the cats and dogs fall" "Nothing")]
                                            @check[(constraint:string-eq (value:string "Where the frog goes") (value:form "Contract-Drill14"))]}
     @item{In which direction(s) can the player-controlled object move? @linebreak[]
                                            @drop-down[#:id "Games-Drill15" #:options (list "Forward" "Backward" "Diagonally" "Vertically" "Horizontally")]
                                            @check[(constraint:string-eq (value:string "Horizontally") (value:form "Contract-Drill15"))]}
     @item{Here's one last game. Play it, and answer the questionts.}
     @item{What happens in the game constantly? @linebreak[]
                                                @drop-down[#:id "Games-Drill16" #:options (list "Crocodiles go down the river only." "The girl swims around." "The background moves." "Crocodiles go sideways." "Crocodiles go up and down the river.")]
                                                @check[(constraint:string-eq (value:string "Crocodiles go up and down the river.") (value:form "Contract-Drill16"))]}
     @item{Which things in the game can the player control? @linebreak[]
                                            @drop-down[#:id "Games-Drill17" #:options (list "The girl's position" "The position of the crocodiles" "How many crocodiles there are" "The color of the background" "The size of the girl")]
                                            @check[(constraint:string-eq (value:string "The girl's position") (value:form "Contract-Drill17"))]}
     @item{In which direction(s) can the player-controlled object move? @linebreak[]
                                            @drop-down[#:id "Games-Drill18" #:options (list "Diagonally" "Vertically only" "Horizontally only" "Vertically and horizontally" "Up, down, and right")]
                                            @check[(constraint:string-eq (value:string "Vertically and horizontally") (value:form "Contract-Drill18"))]}
     ]}
