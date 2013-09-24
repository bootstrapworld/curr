#lang curr/lib

@(define exprs '((- (+ 17 16) (* 13 17))
                 (+ (* 12 5) 24)
                 (- (* 4 13) (- 19 21))
                 (- 21 (* 4 13))
                 (- (- 19 9) (* (+ 10 9) -3))
                 (* 1 (* 21 10))
                 (- (* 17 (* 5 5)) 4)))

@(exercise-handout 
  #:title "Converting Circles of Evaluation to Code"
  #:forevidence "A-SSE.1-2&1&3"
  #:instr "For each Circle of Evaluation below, write down the code that corresponds to the Circle:"
  @(create-exercise-itemlist #:with-answer-blanks? #t (map sexp exprs)))
