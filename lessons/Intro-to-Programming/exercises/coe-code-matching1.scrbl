#lang curr/lib

@(define exprs '((* (- 4 24) (+ 13 25))
                 (- (- 14 13) 14)
                 (* (- 6 16) 14)
                 (* 16 (- 14 6))
                 (+ (- 8 11) 5)
                 (- (+ 8 11) 5)
                 (* (+ 19 20) (- (+ 12 10) 22))
                 (- 22 (* 7 (* 6 10)))
                 ))

@(define permuted-exprs 
               '((- (+ 8 11) 5)
		 (- (- 14 13) 14)
                 (- 22 (* 7 (* 6 10)))
                 (* 16 (- 14 6))
                 (* (- 6 16) 14)
                 (+ (- 8 11) 5)
		 (* (- 4 24) (+ 13 25))
		 (* (+ 19 20) (- (+ 12 10) 22))
                 ))

@(define expr-coes (map sexp->coe exprs))

@(exercise-handout 
  #:title "Matching Circles of Evaluation and Code"
  #:instr "Draw a line from each Circle of Evaluation on the left to the corresponding code on the right."
  @;#:forevidence (list "BS-CE&1&4")
  @(matching-exercise expr-coes (map sexp->code permuted-exprs))
  @(exercise-answers
    (matching-exercise-answers #:compare-with equal?
                               #:content-of-ans exprs
        expr-coes (map sexp->code exprs) permuted-exprs))
  )

