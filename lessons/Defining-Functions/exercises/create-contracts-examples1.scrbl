#lang curr/lib

@(define e1
   (code #:multi-line #t 
"(EXAMPLE (big-triangle 100 \"red\") 
         (triangle 100 \"solid\" \"red\"))
(EXAMPLE (big-triangle 100 \"orange\") 
         (triangle 100 \"solid\" \"orange\"))"))
@(define c1 (code "; big-triangle : number string -> image"))


@(define e2
   (code #:multi-line #t
"(EXAMPLE (purple-square 15) 
         (rectangle 15 15 \"outline\" \"purple\"))
(EXAMPLE (purple-square 6) 
         (rectangle 6 6 \"outline\" \"purple\"))"))
@(define c2 (code "; purple-square : number -> image"))


@(define e3
   (code #:multi-line #t
"(EXAMPLE (banner \"Game Today!\") 
         (text \"Game Today!\" 50 \"red\"))
(EXAMPLE (banner \"Go Team!\") 
         (text \"Go Team!\" 50 \"red\"))
(EXAMPLE (banner \"Exit\") 
         (text \"Exit\" 50 \"red\"))"))
@(define c3 (code "; banner : string -> image"))


@(define e4
   (code #:multi-line #t
"(EXAMPLE (twinkle 5 \"outline\") 
         (star 5 \"outline\" \"yellow\"))
(EXAMPLE (twinkle 15 \"solid\") 
         (star 15 \"solid\" \"yellow\"))
(EXAMPLE (twinkle 36 \"outline\") 
         (star 36 \"outline\" \"yellow\")"))
@(define c4 (code "; twinkle : number string -> image"))


@(define e5
   (code #:multi-line #t
"(EXAMPLE (half 2)
         (/ 2 2))
(EXAMPLE (half 4) 
         (/ 4 2))
(EXAMPLE (half 9) 
         (/ 9 2))"))
@(define c5 (code "; half : number -> number"))


@(define e6
   (code #:multi-line #t
"(EXAMPLE (how-long? \"Soccer\")  6)
(EXAMPLE (how-long? \"Cupcakes\")  8)
(EXAMPLE (how-long? \"Hi Mom\")  6)
(EXAMPLE (how-long? \"Cheese pizza\")  12)"))
@(define c6 (code "; how-long? : string -> number"))

@(define e7
   (code #:multi-line #t
"(EXAMPLE (shrink (circle 10 \"solid\" \"green\"))
         (scale .5 (circle 10 \"solid\" \"green\")))
(EXAMPLE (shrink (rectangle 20 6 \"solid\" \"orange\"))
         (scale .5 (rectangle 20 6 \"solid\" \"orange\")))"))
@(define c7 (code "; shrink : image -> image"))

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

@(define examples-lst (list e1 e2 e3 e13 e4 e5 e6 e7 e8 e9 e10 e11 e12 ))
@(define answers-lst (list c1 c2 c3 c13 c4 c5 c6 c7 c8 c9 c10 c11 c12 ))
@(define answers-atop (map list answers-lst examples-lst))

@(exercise-handout 
  #:title "Creating Contracts From Examples"
  #:instr "For each of the following collections of Examples, write the contract
           for the function above the examples."
  #:forevidence (exercise-evid-tags "BS-DR.2&1&1" "F-IF.1-3&1&1" "F-IF.1-3&1&2")
  @(create-exercise-itemlist/contract-answers examples-lst)
  @(exercise-answers
    (create-exercise-itemlist answers-atop))
    @;(questions-and-answers examples-lst answers-lst))
  )
