#lang curr/lib

@(define exprs (list '(+ 4 5) 
                     '(* 7 6)
                     '(- (* 2 3) (+ 1 0))
                     '(- (+ 5 8) 12)
                     '(* -2 -6)
                     '(+ (* 5 -2) 12)
                     '(- 12 (* 2 5))
                     '(+ (* 2 (+ 3 1)) 10)
                     ))

@title{Exercise: Evaluating Circles of Evaluation}

@(exercise-handout 
  #:instr "For each Circle of Evaluation below, evaluate the Circle and 
   write down the answer (a number):"
  @;Using matching exercise to override right floats of CoE in CSS
  @(matching-exercise 
    (map (lambda (s index) (elem (format "~a:" index) (sexp (format "~a" s))))
         exprs (build-list (length exprs) (lambda (i) (add1 i))))
    (build-list (length exprs) (lambda (i) "")))
  )

@(copyright)