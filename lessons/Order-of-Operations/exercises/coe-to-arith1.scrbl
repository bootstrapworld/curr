#lang curr/lib

@(define exprs (list '(+ 4 5) 
                     '(* 7 6)
                     '(- (* 2 3) (+ 1 0))
                     '(- (+ 5 8) 12)
                     '(* -2 -6)
                     '(+ (* (- 4 1) -2) 12)
                     '(/ 10 (* 2 (+ 3 1)))
                     ))
@(define sexps-as-coe (map sexp->coe exprs))
@(define sexps-as-math (map sexp->math exprs))

@(exercise-handout 
  #:title "Converting Circles of Evaluation to Arithmetic Expressions"
  #:instr "For each Circle of Evaluation on the left-hand side, write the Arithmetic expression
           for the Circle on the right-hand side:" 
  @(open-response-exercise sexps-as-coe "math")
  @(exercise-answers (questions-and-answers sexps-as-coe sexps-as-math))
  )

