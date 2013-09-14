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
                            (/ 15 (BSLeaveAHoleHere 10 (* 4 BSLeaveAHoleHere)))
                            (+ (BSLeaveAHoleHere 20 (+ BSLeaveAHoleHere 3)) (BSLeaveAHoleHere BSLeaveAHoleHere 3))
                            ))

@(exercise-handout 
  #:title "Completing Partial Circles of Evaluation from Arithmetic Expressions"
  #:instr "Each exercise below gives an arithmetic expression and a partially-finished 
           circle of evaluation for that expression.  Finish the Circle of Evaluation
           so that it represents the arithmetic expression."
  @(matching-exercise 
    (map (lambda (e) (sexp e #:form "code")) exprs) 
    (map sexp exprs-with-holes)))

