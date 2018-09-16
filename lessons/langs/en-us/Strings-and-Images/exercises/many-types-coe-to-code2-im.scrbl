#lang curr/lib

@(define exprs '((rotate 20 (triangle (- 45 6) "solid" "gold"))
                 (scale (+ 4 6) (rectangle 5 8 "outline" "pink"))
                 (rectangle (/ 20 2) 30 "solid" "black")
                 (rotate 255 (scale 3 (ellipse 30 10 "solid" "gray")))
                 (+ 15 (image-height (circle 16 "outline" "teal")))
                 ;(ellipse 30 (+ 20 30) "outline" "red")
                 ;(image-width (rectangle 65 16 "outline" "blue"))
                 ;(circle (sqrt (* 25 5)) "solid" "green")
                 ;(flip-horizontal (scale (string-length "flowers") (bitmap-url "www.images.com/flower_image")))
                 ;(text "Spring time!" (* 4 5) "pink")
                 ;(scale (* 1 .5) (star (/ 100 5) "solid" "gold"))
                 ))

@(define c6 (code #:multi-line #t
"rotate(20, triangle((45 - 6), \"solid\",
                               \"gold\"))"))
@(define c7 (code #:multi-line #t
"scale((4 + 6), rectangle(5, 8, \"outline\",
                                \"pink\"))"))
@(define c8 (code "rectangle((20 / 2), 30, \"solid\", \"black\")"))
@(define c9 (code #:multi-line #t
"rotate(255, scale(3, ellipse(30, 10, 
              \"solid\", \"gray\")))"))
@(define c10 (code #:multi-line #t 
"15 + image-height(circle(16, \"outline\",
                              \"teal\"))"))

@(define exprs-pyret (list c6 c7 c8 c9 c10))

@(define sexps-as-coe (map sexp->coe exprs))
@(define sexps-as-code exprs-pyret)

@(exercise-handout 
  #:title "Converting Circles of Evaluation to Code"
  #:forevidence (exercise-evid-tags "BS-PL.2&1&1")
  #:instr "For each Circle of Evaluation on the left, write down the code on the right:"
  @(open-response-exercise (map sexp exprs) "code")
  @(exercise-answers
    (questions-and-answers sexps-as-coe sexps-as-code))
  )
