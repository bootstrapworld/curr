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
  #:instr "For each Circle of Evaluation below, evaluate the Circle and 
   write down the answer (a number):"
  @(create-exercise-itemlist #:with-answer-blanks? #t exprs-as-coe)
  @(exercise-answers
    (create-exercise-sols-itemlist exprs-as-coe expr-vals))
  )

