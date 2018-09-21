#lang curr/lib

@(define exprs '((* (- 4 24) (+ 13 25))
                 (- (- 14 13) 14)
                 (* (- 6 16) 14)
                 (* 16 (- 14 6))
                 ;(+ (- 8 11) 5)
                 (- (+ 8 11) 5)
                 (* (+ 19 20) (- (+ 12 10) 22))
                 ))

@(define c1 (code "(4 - 24) * (13 + 25)"))
@(define c2 (code "(14 - 13) - 14"))
@(define c3 (code "(6 - 16) * 14"))
@(define c4 (code "(16 * (14 - 6))"))
@(define c5 (code "(8 + 11) - 5"))
;@(define c7 (code "(8 - 11) + 5"))
@(define c6 (code "(19 + 20) * ((12 + 10) - 22)"))

@(define exprs-pyret (list c1 c2 c3 c4 c5 c6))

@(define permuted-exprs-pyret (list c5 c2 c4 c3 c1 c6))

@(define expr-coes (map sexp->coe exprs))

@(exercise-handout 
  #:title "Matching Circles of Evaluation and Code"
  #:instr "Draw a line from each Circle of Evaluation on the left to the corresponding code on the right."
  #:forevidence (exercise-evid-tags "BS-CE&1&4")
  @(matching-exercise expr-coes permuted-exprs-pyret)
  @(exercise-answers
    (matching-exercise-answers
        expr-coes exprs-pyret permuted-exprs-pyret))
  )

