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
  #:instr "For each Circle of Evaluation below, write the arithmetic expression
           that corresponds to the Circle:" 
  @(create-exercise-itemlist #:with-answer-blanks? #t sexps-as-coe)
  @(exercise-answers
    (create-itemlist #:style 'ordered (QAlst->QAelems (map list sexps-as-coe sexps-as-math))))
  )

