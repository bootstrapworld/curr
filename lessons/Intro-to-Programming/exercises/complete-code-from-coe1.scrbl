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
			    (+ BSLeaveAHoleHere3 (- BSLeaveAHoleHere 3))
			    ))

@(define exprs-as-code (map sexp->code exprs))
@(define exprs-as-coe (map sexp->coe exprs))

@(exercise-handout 
  #:title "Completing Partial Code from Circles of Evaluation"
  #:instr "Each exercise below gives an Circle of Evaluation and partially-finished 
           code for that Circle.  Finish the code so that it corresponds to the Circle."
  @(completion-exercise exprs-as-coe (map sexp->code exprs-with-holes)) 
  @(exercise-answers
     (completion-exercise exprs-as-coe exprs-as-code))
  )

