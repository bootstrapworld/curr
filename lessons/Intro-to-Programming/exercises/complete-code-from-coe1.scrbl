#lang curr/lib

@(define exprs '((+ 16 (* 6 -3))
                 (- (+ 25 13) (* 2 4))
                 (* (+ 10 4) 28)
                 (* 13 (/ 7 (+ 2 -4)))
                 (+ (/ (+ 8 1) 3) (- 5 3))
                 ))

@(define exprs-with-holes '((+ BSLeaveAHoleHere (* 6 BSLeaveAHoleHere))
			    (- (+ BSLeaveAHoleHere 13) (BSLeaveAHoleHere BSLeaveAHoleHere 4))
			    (BSLeaveAHoleHere (+ BSLeaveAHoleHere 4) BSLeaveAHoleHere)
			    (* BSLeaveAHoleHere (/ BSLeaveAHoleHere (+ 2 -4)))
			    (+ (BSLeaveAHoleHere (BSLeaveAHoleHere 8 1) BSLeaveAHoleHere) (- BSLeaveAHoleHere 3))
			    ))

@(exercise-handout 
  #:title "Completing Partial Code from Circles of Evaluation"
  #:instr "Each exercise below gives an Circle of Evaluation and partially-finished 
           code for that Circle.  Finish the code so that it corresponds to the Circle."
  @(matching-exercise 
    (map sexp exprs)
    (map (lambda (e) (sexp e #:form "code")) exprs-with-holes) 
    ))

