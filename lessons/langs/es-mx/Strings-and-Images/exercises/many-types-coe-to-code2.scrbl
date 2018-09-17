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

@(define sexps-as-coe (map sexp->coe exprs))
@(define sexps-as-code (map sexp->code exprs))

@(exercise-handout 
  #:title "Convertir Círculos de Evaluación a Código
"
  #:forevidence (exercise-evid-tags "BS-PL.2&1&1")
  #:instr "Para cada Círculo de Evaluación en la columna de la izquierda, escriba el código correspondiente en la columna de la derecha. "
  @(open-response-exercise (map sexp exprs) "code")
  @(exercise-answers
    (questions-and-answers sexps-as-coe sexps-as-code))
  )
