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


@(define exprs-as-coe (map sexp->coe exprs))
@(define expr-vals (map (lambda (e) (math (format "~a" (eval e)))) exprs))

@(exercise-handout 
  #:title "Evaluating Circles of Evaluation"
  #:instr "For each Circle of Evaluation below, evaluate the Circle and 
   write down the answer (a number):"
  @(create-exercise-itemlist #:with-answer-blanks? #t exprs-as-coe)
  @(exercise-answers
    (create-itemlist #:style 'ordered (QAlst->QAelems (map list exprs-as-coe expr-vals))))
  )

