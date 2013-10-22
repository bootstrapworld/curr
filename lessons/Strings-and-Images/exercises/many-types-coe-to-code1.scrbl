#lang curr/lib

@(define exprs '((rotate 20 (triangle (- 45 6) "solid" "gold"))
                 (star (* 5 6) "solid" "brown")
                 (scale (+ 4 (* 3 2)) (rectangle 5 8 "outline" "pink"))
                 (rectangle (/ 20 2) 30 "solid" "darkred")
                 (rotate (- 360 25) (scale 3 (ellipse 30 10 "solid" "gray")))
                 (+ 15 (image-height (circle 16 "outline" "teal")))
                 (ellipse 30 (+ 20 30) "outline" "hotpink")
                 (image-width (rectangle 65 16 "outline" "magenta"))
                 ))

@(define sexps-as-coe (map sexp->coe exprs))
@(define sexps-as-code (map sexp->code exprs))

@(exercise-handout 
  #:title "Converting Circles of Evaluation to Code"
  #:forevidence "A-SSE.1-2&1&3"
  #:instr "For each Circle of Evaluation on the left, write down the code on the right:"
  @(open-response-exercise (map sexp exprs) "code")
  @(exercise-answers
    (questions-and-answers sexps-as-coe sexps-as-code))
  )
