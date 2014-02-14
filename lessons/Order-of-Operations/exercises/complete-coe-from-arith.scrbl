#lang curr/lib

@(define exprs '((- (* 5 9) (+ 2 7))
                 (* (+ 3 12) 16)
                 (+ 20 (* -4 6))
                 (/ 15 (+ 10 (* 4 -2)))
                 (+ (/ 20 (+ 2 3)) (- 6 3))
                 ))

@(define exprs-with-holes '((- (* BSLeaveAHoleHere 9) (+ 2 BSLeaveAHoleHere))
                            (* (+ 3 BSLeaveAHoleHere) BSLeaveAHoleHere)
                            (+ BSLeaveAHoleHere (* BSLeaveAHoleHere 6))
                            (/ 15 (BSLeaveAHoleHere 10 BSLeaveAHoleHere2))
                            (+ (BSLeaveAHoleHere 20 (+ BSLeaveAHoleHere 3)) (BSLeaveAHoleHere BSLeaveAHoleHere 3))
                            ))

@(define exprs-as-code (map sexp->code exprs))
@(define exprs-as-coe (map sexp->coe exprs))

@(exercise-handout 
  #:title "Completing Partial Circles of Evaluation from Arithmetic Expressions"
  #:instr "For each arithmetic expression on the left,  finish the Circle of Evaluation
           on the right by filling in the blanks."
  #:forevidence (exercise-evid-tags "BS-CE&1&1" "BS-CE&1&2")
  @(completion-exercise exprs-as-code (map sexp->coe exprs-with-holes))
  @(exercise-answers
     (completion-exercise exprs-as-code exprs-as-coe))
  )

