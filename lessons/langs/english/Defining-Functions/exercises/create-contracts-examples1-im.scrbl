#lang curr/lib

@(define e1
   (code #:multi-line #t 
"examples:
 big-triangle(100, \"red\") is 
         triangle(100, \"solid\", \"red\")
 big-triangle(100, \"orange\") is
         triangle(100, \"solid\", \"orange\")
end"))
@(define c1 (code "big-triangle :: number, string -> image"))


@(define e2
   (code #:multi-line #t
"examples:
 purple-square(15) is 
         rectangle(15, 15, \"outline\", \"purple\")
 purple-square(6) is 
         rectangle(6, 6, \"outline\", \"purple\")
end"))
@(define c2 (code "purple-square :: number -> image"))


@(define e3
   (code #:multi-line #t
"examples:
 banner(\"Game Today!\") is
         text(\"Game Today!\", 50, \"red\")
 banner(\"Go Team!\") is
         text(\"Go Team!\", 50, \"red\")
 banner(\"Exit\") is
         text(\"Exit\", 50, \"red\")
end"))
@(define c3 (code "; banner : string -> image"))


@(define e4
   (code #:multi-line #t
"examples:
 twinkle(5, \"outline\") is 
         star(5, \"outline\", \"yellow\")
 twinkle(15, \"solid\") is 
         star(15, \"solid\", \"yellow\")
 twinkle(36, \"outline\") is 
         star(36, \"outline\", \"yellow\")
end"))
@(define c4 (code "; twinkle : number string -> image"))


@(define e5
   (code #:multi-line #t
"examples:
 half(2) is (2 / 2)
 half(4) is (4 / 2)
 half(9) is (9 / 2)
end"))
@(define c5 (code "half : number -> number"))


@(define e6
   (code #:multi-line #t
"examples:
 how-long?(\"Soccer\") is 6
 how-long?(\"Cupcakes\") is 8
 how-long?(\"Hi Mom\") is 6
 how-long?(\"Cheese pizza\") is 12
end"))
@(define c6 (code "; how-long? : string -> number"))


@(define examples-lst (list e1 e2 e3 e4 e5 e6 ))
@(define answers-lst (list c1 c2 c3 c4 c5 c6 ))
@(define answers-atop (map list answers-lst examples-lst))

@(exercise-handout 
  #:title "Creating Contracts From Examples"
  #:instr "For each of the following collections of Examples, write the contract
           for the function above the examples."
  #:forevidence (exercise-evid-tags "BS-DR.2&1&1" "F-IF.1-3&1&1" "F-IF.1-3&1&2")
  @(create-exercise-itemlist/contract-answers examples-lst #:pyret #t)
  @(exercise-answers
    (create-exercise-itemlist answers-atop))
    @;(questions-and-answers examples-lst answers-lst))
  )
