#lang curr/lib

@(define exprs '((- (+ 17 16) (* 13 17))
                 (+ (* 12 5) 24)
                 (- (* 4 13) (- 19 21))
                 (- 21 (* 4 13))
                 (- (- 19 9) (* (+ 10 9) -3))
                 (* 1 (* 21 10))
                 (- (* 17 (* 5 5)) 4)))

@(define exprs-as-coe (map sexp->coe exprs))
@(define exprs-as-code (map sexp->code exprs))

@(exercise-handout 
  #:title "Converting Circles of Evaluation to Code"
  #:forevidence "A-SSE.1-2&1&3"
  #:instr "For each Circle of Evaluation below, write down the code that corresponds to the Circle:"
  @(create-exercise-itemlist #:with-answer-blanks? #t exprs-as-coe)
  @(exercise-answers
    (create-itemlist #:style 'ordered (QAlst->QAelems (map list exprs-as-coe exprs-as-code))))
  )
