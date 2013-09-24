#lang curr/lib

@(define e1
   (code #:multi-line #t 
"(EXAMPLE (big-triangle 100 \"red\") (triangle 100 \"solid\" \"red\"))
(EXAMPLE (big-triangle 100 \"orange\") (triangle 100 \"solid\" \"orange\"))"))

@(define e2
   (code #:multi-line #t
"(EXAMPLE (purple-square 15) (rectangle 15 15 \"outline\" \"purple\"))
(EXAMPLE (purple-square 6) (rectangle 6 6 \"outline\" \"purple\"))"))

@(define e3
   (code #:multi-line #t
"(EXAMPLE (banner \"Game Today!\") (text \"Game Today!\" 50 \"red\"))
(EXAMPLE (banner \"Go Team!\") (text \"Go Team!\" 50 \"red\"))
(EXAMPLE (banner \"Exit\") (text \"Exit\" 50 \"red\"))"))

@(define e4
   (code #:multi-line #t
"(EXAMPLE (twinkle 5 \"outline\") (star 5 \"outline\" \"yellow\"))
(EXAMPLE (twinkle 15 \"solid\") (star 15 \"solid\" \"yellow\"))
(EXAMPLE (twinkle 36 \"outline\") (star 36 \"outline\" \"yellow\")"))

@(define e5
   (code #:multi-line #t
"(EXAMPLE (half 2) (/ 2 2))
(EXAMPLE (half 4) (/ 4 2))
(EXAMPLE (half 9) (/ 9 2))"))

@(define e6
   (code #:multi-line #t
"(EXAMPLE (how-long? \"Soccer\") 6)
(EXAMPLE (how-long? \"Cupcakes\") 8)
(EXAMPLE (how-long? \"Hi Mom\") 6)
"))

@(define examples-lst
   (list e1 e2 e3 e4 e5 e6))

@(exercise-handout 
  #:title "Creating Contracts From Examples"
  #:instr "For each of the following collections of Examples, write the contract
           for the function named in the examples."

  @(create-exercise-itemlist (map (lambda (e) (list e "Answer:" (contract-exercise "test"))) examples-lst)))
