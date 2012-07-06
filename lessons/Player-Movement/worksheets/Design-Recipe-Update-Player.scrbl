#lang curr/lib
@title{Design Recipe: update-player}
@worksheet{
    Write a function called update-player which takes in the player's y-coordinate and the name of the key pressed, and returns the new y-coordinate.
    
    @worksheet-segment{I.  Contract + Purpose Statement}
    Every contract has three parts:
    
    @contract-exercise["up1" #:name "update-player" #:domain "number string" #:range "number"]
    
    @worksheet-segment{II. Give Examples}
    Write an example of your function for each key, using EXAMPLE
    
    (EXAMPLE (@fill-in-the-blank[#:id "up2" #:label "Use the function here" #:answer "update-player 40 \"up\""]) @fill-in-the-blank[#:id "up3" #:label "What should the function produce" #:answer "(+ 40 20)"])
    
    (EXAMPLE (@fill-in-the-blank[#:id "up4" #:label "Use the function here" #:answer "update-player 400 \"down\""]) @fill-in-the-blank[#:id "up5" #:label "What should the function produce" #:answer "(- 400 20)"])
    
    @worksheet-segment{III. Function Header}
    Write the function Header, giving variable names to all your input values.
    
    (define (@fill-in-the-blank[#:id "up6" #:label "function name" #:answer "update-player"] @fill-in-the-blank[#:id "up6" #:label "variable names" #:answer "player-y key"])
     
    (@fill-in-the-blank[#:id "up7" #:answer "cond"]
     
     @fill-in-the-blank[#:id "up8" #:label "Condition1" #:answer "(string=? \"up\" key)"] @fill-in-the-blank[#:id "up9" #:label "Answer1" #:answer "(+ player-y 20)"]
     
     @fill-in-the-blank[#:id "up10" #:label "Condition2" #:answer "(string=? \"down\" key)"] @fill-in-the-blank[#:id "up11" #:label "Answer2" #:answer "(- player-y 20)"]
     
     @fill-in-the-blank[#:id "up12" #:label "Condition3" #:answer "else"] @fill-in-the-blank[#:id "up13" #:label "Answer3" #:answer "player-y"]
     
     @fill-in-the-blank[#:id "up14" #:label "Condition4" #:answer ""] @fill-in-the-blank[#:id "up15" #:label "Answer4" #:answer ""]
     
     @fill-in-the-blank[#:id "up16" #:label "Condition5" #:answer ""] @fill-in-the-blank[#:id "up17" #:label "Answer5" #:answer ""])}
