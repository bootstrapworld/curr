#lang curr/lib

@(define e1 (code "(big-star \"purple\")"))
@(define c1 (code "; big-star : string -> image")) 

@(define e2 (code "(big-star 25 \"gold\")"))
@(define c2 (code "; big-star : number string -> image"))

@(define e3 (code "(message-cost 15))"))
@(define c3 (code "; message-cost : number -> number"))

@(define e4 (code "(message-cost \"where are you?\"))"))
@(define c4 (code "; message-cost : string -> number"))

@(define e5 (code "(show-score \"Red Sox\" 6 \"Cardinals\" 4))"))
@(define c5 (code "; show-score : string number string number -> image"))

@(define e6 (code "(show-score \"Red Sox\" \"Cardinals\" 5 5))"))
@(define c6 (code "; show-score : string string number number -> image"))
@(define c6a (code "; show-score : string string -> image"))
@(define c6b (code "; show-score : string number -> image"))

@(define e7 (code "(find-winner \"Red Sox\" 4 \"Cardinals\" 6))"))
@(define c7 (code "; find-winner : string number string number -> string"))

@(define e8 (code "(pick-flavor \"vanilla\" \"oreo\" \"mint\"))"))
@(define c8 (code "; pick-flavor : string string string -> image"))

@(define e9 (code "(prefer-flavor \"lemon\" \"lime\"))"))
@(define c9 (code "; prefer-flavor : string string -> number"))
@(define c9a (code "; choose-flavor : string string -> string"))

@(exercise-handout
  #:title "Matching Expressions and Contracts"
  #:instr "Try to match each Expression in the left column with a Contract in the right column 
           that describes the function used in the expression.  Some expressions or contracts
           might not have a match."
  @(matching-exercise
    (list e1 e2 e3 e4 e5 e6 e7 e8 e9)
    (list c2 c4 c3 c6a c6b c5 c9 c9a c8)))
