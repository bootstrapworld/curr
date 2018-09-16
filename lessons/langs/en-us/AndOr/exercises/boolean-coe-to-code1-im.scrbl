#lang curr/lib

@(define exprs '((> (+ 4 5) 9)
                 ;(or (> 10 11) (<= 7 9))
                 (and (< 5 10) (< 10 15))
                 (or (string-equal yum "apple") (string-equal yum "banana"))
                 (>= (string-length "My Game") 6)
                 (or (and (< 1 x) (< x 5))
                     (and (< 8 x) (< x 10)))
                 ))

@(define c1 (code "(4 + 5) > 9"))
@(define c2 (code "(10 > 11) or (7 <= 9)"))
@(define c3 (code "(5 < 10) and (10 < 15)"))
@(define c4 (code #:multi-line #t
"string-equal(yum, \"apple\") or 
  string-equal(yum, \"banana\")"))
@(define c5 (code #:multi-line #t
"((1 < x) and (x < 5)) or 
  ((8 < x) and (x < 10))"))

@(define exprs-pyret (list c1 c2 c3 c4 c5))

@(define exprs-as-coe (map sexp exprs))
@(define exprs-as-code exprs-pyret)

@(exercise-handout 
  #:title "Converting Circles of Evaluation with Booleans to Code"
  #:instr "For each Circle of Evaluation in the left column, write the code that corresponds to the Circle in the right column:"
  #:forevidence (exercise-evid-tags "BS-CE&1&4")
  @(open-response-exercise exprs-as-coe "code")
  @(exercise-answers (questions-and-answers exprs-as-coe exprs-as-code))
  )
