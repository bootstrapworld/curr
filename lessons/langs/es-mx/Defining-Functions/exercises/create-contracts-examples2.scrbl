#lang curr/lib

@(define e8
   (code #:multi-line #t
"(EXAMPLE (third-root 16)
          (expt 16 1/3)
(EXAMPLE (third-root 125)
          (expt 125 1/3)
(EXAMPLE (third-root 625)
          (expt 625 1/3)"))
@(define c8 (code "; third-root : number -> number"))

@(define e9
   (code #:multi-line #t
"(EXAMPLE (sentence-length \"hello\" 5)
          (+ (string-length \"hello\") 5))
(EXAMPLE (sentence-length \"please\" 6)
          (+ (string-length \"please\") 6))
(EXAMPLE (sentence-length \"goodbye\" 10)
          (+ (string-length \"please\") 10))"))
@(define c9 (code "; sentence-length : string number -> number"))

@(define e10
   (code #:multi-line #t
"(EXAMPLE (upside-down (triangle 50 \"solid\" \"yellow\"))
          (rotate 180 (triangle 50 \"solid\" \"yellow\")))
(EXAMPLE (upside-down (star 150 \"outline\" \"blue\"))
          (rotate 180 (star 150 \"outline\" \"blue\")))"))
@(define c10 (code "; upside-down : image -> image"))

@(define e11
   (code #:multi-line #t
"(EXAMPLE (product-squared 5 6)
          (sqr (* 5 6))
(EXAMPLE (product-squared 10 17)
          (sqr (* 10 17)))
(EXAMPLE (product-squared 2 5)
          (sqr (* 2 5)))"))
@(define c11 (code "; product-squared : number number -> number"))

@(define e12
   (code #:multi-line #t
"(EXAMPLE (half-image \"www.images.com/cat_image\")
          (scale .5 (bitmap/url \"www.images.com/cat_image\")))
(EXAMPLE (half-image \"www.images.com/dog_image\")
          (scale .5 (bitmap/url \"www.images.com/dog_image\")))"))
@(define c12 (code "; half-image : string -> image"))

@(define e13
   (code #:multi-line #t
"(EXAMPLE (triple 4)
          (* 4 3))
(EXAMPLE (triple 10)
          (* 10 3))
(EXAMPLE (triple 3)
          (* 3 3))"))
@(define c13 (code "; triple : number -> number"))

@(define examples-lst (list e8 e9 e10 e11 e12 e13))
@(define answers-lst (list c8 c9 c10 c11 c12 c13))
@(define answers-atop (map list answers-lst examples-lst))

@(exercise-handout 
  #:title "Crear Contratos a partir de Ejemploss"
  #:instr "Para cada una de las siguientes colecciones de ejemplos, escriba el contrato
           para la función arriba de los ejemplos."
  #:forevidence (exercise-evid-tags "BS-DR.2&1&1" "F-IF.1-3&1&1" "F-IF.1-3&1&2")
  @(create-exercise-itemlist/contract-answers examples-lst)
  @(exercise-answers
    (create-exercise-itemlist answers-atop))
    @;(questions-and-answers examples-lst answers-lst))
  )
