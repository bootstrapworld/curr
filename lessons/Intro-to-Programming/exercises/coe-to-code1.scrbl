#lang curr/lib

@(define exprs (list '((- (+ 17 16) (* 13 17))
		       (* (* 19 11) (* 1 23))
		       (+ (* 12 5) 24)
		       (- (* 4 13) (- 19 21))
		       (- (+ 7 21) (* 4 13))
		       (- (- 19 9) (* 19 -3))
		       (* 1 (* 21 10))
		       (- (* 17 25) 4))))

@title{Exercise: Coding Circles of Evaluation}

@(exercise-handout 
  #:instr "For each Circle of Evaluation below, write down the code that corresponds to the Circle:"
  @;Using matching exercise to override right floats of CoE in CSS
  @(matching-exercise 
    (map (lambda (s index) (elem (format "~a:" index) (sexp (format "~a" s))))
         exprs (build-list (length exprs) (lambda (i) (add1 i))))
    (build-list (length exprs) (lambda (i) "")))
  )

@(copyright)