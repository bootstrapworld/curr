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

@; this should be done using eval, but need to figure out why that raises a (syntax) error
@(define expr-ans '(9 42 5 1 12 2 2 18))

@(define exprs-as-coe (map sexp->coe exprs))
@;(define expr-vals (map (lambda (e) (math (format "~a" (eval e)))) exprs))
@(define expr-vals (map (lambda (v) (format "~a" v)) expr-ans))

@(exercise-handout 
  #:title "Evaluating Circles of Evaluation"
  #:instr "For each Circle of Evaluation on the left, evaluate the Circle and 
   write down the ANSWER (a number) on the right:"
  #:forevidence (list "BS-CE&1&3" "6.EE.1-4")
  @(open-response-exercise exprs-as-coe "text")
  @(exercise-answers
    (questions-and-answers exprs-as-coe expr-vals))
  )

