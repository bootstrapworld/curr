#lang curr/lib

@(define exprs (list '(+ 4 5) 
                     '(* 7 6)
                     '(- (* 2 3) (+ 1 0))
                     '(- (+ 5 8) 12)
                     '(* -2 -6)
                     '(+ (* (- 4 1) -2) 12)
                     '(/ 10 (* 2 (+ 3 1)))
                     ))

@(exercise-handout 
  #:title "Converting Circles of Evaluation to Arithmetic Expressions"
  #:instr "For each Circle of Evaluation below, write the arithmetic expression
           that corresponds to the Circle:" 
  @;Using matching exercise to override right floats of CoE in CSS
  @(matching-exercise 
    (map (lambda (s index) (elem (format "~a." index) (sexp s)))
         exprs (build-list (length exprs) (lambda (i) (add1 i))))
    (build-list (length exprs) (lambda (i) "")))
  )

