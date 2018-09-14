#lang curr/lib

@(define exprs '((* (- 4 24) (+ 13 25))
                 (- (- 14 13) 14)
                 (* (- 6 16) 14)
                 (* 16 (- 14 6))
                 ;(+ (- 8 11) 5)
                 (- (+ 8 11) 5)
                 (* (+ 19 20) (- (+ 12 10) 22))
                 ))

@(define exprs-pyret (list (elem @code{ (4 - 24) * (13 + 25) })
                           (elem @code{ (14 - 13) - 14 })
                           (elem @code{ (6 - 16) * 14 })
                           (elem @code{ (16 * (14 - 6)) })
                           (elem @code{ (8 + 11) - 5 })
                           (elem @code{ (19 + 20) * ((12 + 10) - 22) })
                           ))

@(define permuted-exprs 
               '((- (+ 8 11) 5)
                 (- (- 14 13) 14)
                 (* 16 (- 14 6))
                 (* (- 6 16) 14)
                 ;(+ (- 8 11) 5)
                 (* (- 4 24) (+ 13 25))
                 (* (+ 19 20) (- (+ 12 10) 22))
                 ))

@(define permuted-exprs-pyret (list (elem @code{ (8 + 11) - 5 })
                                    (elem @code{ (14 - 13) - 14 })
                                    (elem @code{ (16 * (14 - 6)) })
                                    (elem @code{ (6 - 16) * 14 })
                                    (elem @code{ (4 - 24) * (13 + 25) })
                                    (elem @code{ (19 + 20) * ((12 + 10) - 22) })
                              ))

@(define expr-coes (map sexp->coe exprs))

@(exercise-handout 
  #:title "Matching Circles of Evaluation and Code"
  #:instr "Draw a line from each Circle of Evaluation on the left to the corresponding code on the right."
  #:forevidence (exercise-evid-tags "BS-CE&1&4")
  @(matching-exercise expr-coes permuted-exprs-pyret)
  @(exercise-answers
    (matching-exercise-answers #:compare-with equal?
                               #:content-of-ans exprs
                               #:some-no-match? #t ;; only here to get this to compile without errors; exercise should have all matches
        expr-coes exprs-pyret permuted-exprs-pyret))
  )

