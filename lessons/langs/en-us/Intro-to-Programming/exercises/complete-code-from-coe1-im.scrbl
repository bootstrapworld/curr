#lang curr/lib

@(define exprs '((+ 16 (* 6 -3))
                 (- (+ 25 13) (* 2 4))
                 (* (+ 10 4) 28)
                 (* 13 (/ 7 (+ 2 -4)))
                 (+ (/ (+ 8 1) 3) (- 5 3))
                 ))

@(define exprs-pyret (list (code "16 + (6 * -3)")
                           (code "(25 + 13) + (2 * 4)")
                           (code "(10 + 4) * 28")
                           (code "13 * (7 / (2 + -4))")
                           (code "((8 + 1) / 3) + (5 - 3)")
))

;; left with excess parentheses to parse the blanks
@(define exprs-with-holes '((BSLeaveAHoleHere + (6 * BSLeaveAHoleHere))
			    ((BSLeaveAHoleHere + 13) - (BSLeaveAHoleHere BSLeaveAHoleHere 4))
			    ((BSLeaveAHoleHere + 4) BSLeaveAHoleHere BSLeaveAHoleHere)
			    (BSLeaveAHoleHere * (BSLeaveAHoleHere / (2 + -4)))
			    (BSLeaveAHoleHere + (BSLeaveAHoleHere - 3))
			    ))

@(define exprs-as-code exprs-pyret)
@(define exprs-as-coe (map sexp->coe exprs))

@(exercise-handout 
  #:title "Completing Partial Code from Circles of Evaluation"
  #:instr "Each Circle of Evaluation on the left has been partially-converted to code on the right.
   Finish the code by filling in the gaps, so that it matches the Circle."
  #:forevidence (exercise-evid-tags "BS-CE&1&4")
  @(completion-exercise exprs-as-coe (map sexp->code exprs-with-holes)) 
  @(exercise-answers
     (completion-exercise exprs-as-coe exprs-as-code))
  )

