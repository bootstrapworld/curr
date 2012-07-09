#lang curr/lib

@drill{
  @itemlist[
    @item{Try out this simple coloring game!}
     @item{List the things in this game. Note: You may not have to use all the blanks provided.
           
                                         @fill-in-the-blank[#:id "Games-Drill1"]
                                         @fill-in-the-blank[#:id "Games-Drill2"]
                                         @fill-in-the-blank[#:id "Games-Drill3"]}
     @item{What do each of these things do? 

                                            @fill-in-the-blank[#:id "Games-Drill4"]
                                            @fill-in-the-blank[#:id "Games-Drill5"]
                                            @fill-in-the-blank[#:id "Games-Drill6"]}
     @item{What is constantly changing in the game, even when you are not doing anything? 
           
                                                @drop-down[#:id "Games-Drill31" #:options (list "Select an answer" "The star moves around." "The colors change." "The star gets bigger." "Nothing.")]
                                                @check[(constraint:string-eq (value:string "Nothing.") (value:form "Games-Drill31"))]}
     @item{Which things in the game can the player control?
           
                                                @drop-down[#:id "Games-Drill32" #:options (list "Select an answer" "The location of the star." "The color that appears first, when you press the spacebar." "The size of the star." "Nothing.")]
                                                @check[(constraint:string-eq (value:string "The location of the star.") (value:form "Games-Drill32"))]}
     @item{In which direction(s) can the player-controlled object move (with only one keystroke)?
           
                                                @drop-down[#:id "Games-Drill33" #:options (list "Select an answer" "Up, down, left, or right." "Forward." "Diagonally." "L-shape." "Left or right.")]
                                                @check[(constraint:string-eq (value:string "Up, down, left, or right.") (value:form "Games-Drill33"))]}
     @item{Now play this balloon game.}
     @item{List the things in this game: 
           
                                         @fill-in-the-blank[#:id "Games-Drill7"]
                                         @fill-in-the-blank[#:id "Games-Drill8"]
                                         @fill-in-the-blank[#:id "Games-Drill9"]}
     @item{What do each of these things do? 
           
                                            @fill-in-the-blank[#:id "Games-Drill10"]
                                            @fill-in-the-blank[#:id "Games-Drill11"]
                                            @fill-in-the-blank[#:id "Games-Drill12"]}
     @item{What is constantly changing in the game, even when you are not doing anything?
           
                                                @drop-down[#:id "Games-Drill34" #:options (list "Select an answer" "The balloon gets bigger." "The balloon gets smaller." "Nothing." "The balloon changes color." "The balloon moves left and right.")]
                                                @check[(constraint:string-eq (value:string "Nothing.") (value:form "Games-Drill34"))]}
     @item{Which things in the game can the player control? 
           
                                                @drop-down[#:id "Games-Drill35" #:options (list "Select an answer" "The color of the balloon." "The placement of the balloon." "How much the balloon grows." "Nothing.")]
                                                @check[(constraint:string-eq (value:string "How much the balloon grows.") (value:form "Games-Drill35"))]}
     @item{Try playing this game, and answer the following questions.}
     @item{List the things in this game. Note: You may not have to use all the blanks provided. 
           
                                         @fill-in-the-blank[#:id "Games-Drill19"]
                                         @fill-in-the-blank[#:id "Games-Drill20"]
                                         @fill-in-the-blank[#:id "Games-Drill21"]}
     @item{What do each of these things do? 
           
                                            @fill-in-the-blank[#:id "Games-Drill22"]
                                            @fill-in-the-blank[#:id "Games-Drill23"]
                                            @fill-in-the-blank[#:id "Games-Drill24"]}
     @item{What happens in the game constantly, even when you are not doing anything? 
           
                                                @drop-down[#:id "Games-Drill13" #:options (list "Select an answer" "Cats fall." "Dogs get bigger." "The frog moves." "Cats and dogs fall." "The background changes color.")]
                                                @check[(constraint:string-eq (value:string "Cats and dogs fall.") (value:form "Games-Drill13"))]}
     @item{Which things in the game can the player control? 
           
                                            @drop-down[#:id "Games-Drill14" #:options (list "Select an answer" "The size of the frog" "Where the frog goes" "Where the cats and dogs fall" "How fast the cats and dogs fall" "Nothing")]
                                            @check[(constraint:string-eq (value:string "Where the frog goes") (value:form "Games-Drill14"))]}
     @item{In which direction(s) can the player-controlled object move? @

                                            @drop-down[#:id "Games-Drill15" #:options (list "Select an answer" "Forward" "Backward" "Diagonally" "Vertically" "Horizontally")]
                                            @check[(constraint:string-eq (value:string "Horizontally") (value:form "Games-Drill15"))]}
     @item{Here's one last game. Play it, and answer the questions.}
     @item{List the things in this game. Note: You may not have to use all the blanks provided.
           
                                         @fill-in-the-blank[#:id "Games-Drill25"]
                                         @fill-in-the-blank[#:id "Games-Drill26"]
                                         @fill-in-the-blank[#:id "Games-Drill27"]}
     @item{What do each of these things do? 
           
                                            @fill-in-the-blank[#:id "Games-Drill28"]
                                            @fill-in-the-blank[#:id "Games-Drill29"]
                                            @fill-in-the-blank[#:id "Games-Drill30"]}
     @item{What happens in the game constantly, even when you are not doing anything? 
           
                                                @drop-down[#:id "Games-Drill16" #:options (list "Select an answer" "Crocodiles go down the river only." "The girl swims around." "The background moves." "Crocodiles go sideways." "Crocodiles go up and down the river.")]
                                                @check[(constraint:string-eq (value:string "Crocodiles go up and down the river.") (value:form "Games-Drill16"))]}
     @item{Which things in the game can the player control? 
           
                                            @drop-down[#:id "Games-Drill17" #:options (list "Select an answer" "The girl's position" "The position of the crocodiles" "How many crocodiles there are" "The color of the background" "The size of the girl")]
                                            @check[(constraint:string-eq (value:string "The girl's position") (value:form "Games-Drill17"))]}
     @item{In which direction(s) can the player-controlled object move? 
           
                                            @drop-down[#:id "Games-Drill18" #:options (list "Select an answer" "Diagonally" "Vertically only" "Horizontally only" "Vertically and horizontally" "Up, down, and right")]
                                            @check[(constraint:string-eq (value:string "Vertically and horizontally") (value:form "Games-Drill18"))]}
     ]}
