#lang curr/lib

@(define exprs '(;(rotate 20 (triangle (- 45 6) "solid" "gold"))
                 ;(scale (+ 4 6) (rectangle 5 8 "outline" "pink"))
                 ;(rectangle (/ 20 2) 30 "solid" "black")
                 ;(rotate 255 (scale 3 (ellipse 30 10 "solid" "gray")))
                 ;(+ 15 (image-height (circle 16 "outline" "teal")))
                 (ellipse 30 (+ 20 30) "outline" "red")
                 (image-width (rectangle 65 16 "outline" "blue"))
                 (circle (num-sqrt (* 25 5)) "solid" "green")
                 ;(flip-horizontal (scale (string-length "flowers") (bitmap-url "www.images.com/flower_image")))
                 (text "Spring time!" (* 4 5) "pink")
                 (scale (* 1 0.5) (star (/ 100 5) "solid" "gold"))
                 ))

@(define c1 (code "ellipse(30, (20 + 30), \"outline\", \"red\")"))
@(define c2 (code #:multi-line #t
"image-width(rectangle(65, 16, \"outline\",
                               \"blue\"))"))
@(define c3 (code #:multi-line #t
"circle(num-sqrt((5 * 25)), \"solid\", 
                            \"green\")"))
@(define c4 (code "text(\"Spring time!\", (4 * 5), \"pink\")"))
@(define c5 (code #:multi-line #t 
"scale((1 * 0.5), star((100 / 5), \"solid\",
                                  \"gold\"))"))

@(define exprs-pyret (list c1 c2 c3 c4 c5))

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
