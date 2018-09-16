#lang curr/lib

@(define exprs '((and (string-equal place "safe") 
                      (or (>= x 50) (<= y 2)))
                 (and (or (== 6 7) (> 7 5)) (< 8 10))
                 (string-equal "6" "7")
                 (> (+ 6 7) 15)
                 (or (== (* 6 5) 30) (< 8 9)) 
                 ;(== (string-length "Bananas") 8) 
                 ))

@(define c1 (code #:multi-line #t
"string-equal(place, \"safe\") and 
  ((x >= 50) or (y <= 2))"))
@(define c2 (code "((6 == 7) or (7 > 5)) and (8 < 10)"))
@(define c3 (code "string-equal(\"6\", \"7\")"))
@(define c4 (code "(6 + 7) > 15"))
@(define c5 (code "((6 * 5) == 30) or (8 < 9)"))

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
