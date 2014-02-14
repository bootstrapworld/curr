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
"(EXAMPLE (how-long? \"Soccer\") 
         6)
(EXAMPLE (how-long? \"Cupcakes\") 
         8)
(EXAMPLE (how-long? \"Hi Mom\") 
         6)"))
@(define c6 (code "; how-long? : string -> number"))


@(define e7
   (code #:multi-line #t
"(EXAMPLE (shrink (circle 10 \"solid\" \"green\"))
         (scale .5 (circle 10 \"solid\" \"green\")))
(EXAMPLE (shrink (rectangle 20 6 \"solid\" \"orange\"))
         (scale .5 (rectangle 20 6 \"solid\" \"orange\")))"))
@(define c7 (code "; shrink : image -> image"))


@(define examples-lst (list e1 e2 e3 e4 e5 e6 e7))
@(define answers-lst (list c1 c2 c3 c4 c5 c6 c7))
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
