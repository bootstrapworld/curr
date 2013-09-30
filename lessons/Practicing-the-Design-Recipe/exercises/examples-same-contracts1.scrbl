#lang curr/lib

@(define e1
   (code #:multi-line #t
"(EXAMPLE (mystery 30)
         (* 30 50))
(EXAMPLE (mystery 10)
         (text \"Welcome!\" 10 \"darkgreen\"))"))
@(define a1 "no match (the range types are different)")


@(define e2
   (code #:multi-line #t
"(EXAMPLE (mystery 30 40)
         (- 40 (* 2 30)))
(EXAMPLE (mystery 10 15)
         (- 15 (* 2 10))"))
@(define a2 (code "; mystery : number number -> number"))


@(define e3
   (code #:multi-line #t
"(EXAMPLE (mystery \"New York\")
         (text \"New York\" 20 \"red\"))
(EXAMPLE (mystery 20)
         (text \"New York\" 20 \"red\"))"))
@(define a3 "no match (the domain types are different)")


@(define e4
   (code #:multi-line #t
"(EXAMPLE (mystery \"green\" 32)
         (circle 32 \"outline\" \"green\"))
(EXAMPLE (mystery 18 \"green\")
         (circle 18 \"outline\" \"green\"))"))
@(define a4 "no match (the domain types are in different orders)")

@(define e5
   (code #:multi-line #t
"(EXAMPLE (mystery 6 9 10)
         (/ 6 (+ 9 10)))
(EXAMPLE (mystery 3 7)
         (/ 3 (+ 7 10))"))
@(define a5 "no match (the domains have different numbers of arguments)")

@(define e6
   (code #:multi-line #t
"(EXAMPLE (mystery \"red\" \"blue\")
         (text \"blue\" 25 \"red\"))
(EXAMPLE (mystery \"purple\" \"Go Team!\")
         (text \"Go Team!\" 25 \"purple\"))"))
@(define a6 (code "; mystery : string string -> image"))


@(define e7
   (code #:multi-line #t
"(EXAMPLE (mystery (circle 55 \"outline\" \"black\") 12)
         (scale 12 (circle 55 \"outline\" \"black\")))
(EXAMPLE (mystery (rectangle 24 32 \"outline\" \"purple\") 5)
         (scale 5 (rectangle 24 32 \"outline\" \"purple\")))"))
@(define a7 (code "; mystery : image number -> image"))


@(define e8
   (code #:multi-line #t
"(EXAMPLE (mystery \"Free Phone\" 25 \"darkgreen\")
         (text \"Free Phone\" 25 \"darkgreen\"))
(EXAMPLE (mystery 25 \"Free Phone\")
         (text \"Free Phone\" 25 \"darkgreen\"))"))
@(define a8 "no match (the domains have different numbers and order of arguments)")


@(define e9
   (code #:multi-line #t
"(EXAMPLE (mystery 30)
         (rectangle 30 30 \"outline\" \"red\"))
(EXAMPLE (mystery 10)
         (circle 10 \"outline\" \"red\"))"))
@(define a9 (elem (code "; mystery : number -> image") 
                  "This is tricky: the datatypes match (which is what a contract
                   requires), but the output is different (a rectangle instead of 
                   a circle).  Students will learn how to write functions that 
                   produce different outputs like this later in the course."))



@(exercise-handout
  #:title "Do Examples Have the Same Contracts?"
  #:instr "For each of the following pairs of Examples, decide whether the two examples
           correspond to the same contract. If the examples have the same contract, write
           it down.  If they do not, write \"don't match\" and say a few words about
           why they don't match."
  @(create-exercise-itemlist
    (map (lambda (e) (list e "Answer:" (contract-exercise "test"))) 
         (list e1 e2 e3 e4 e5 e6 e7 e8 e9))))
