#lang curr/lib

@(define exprs (list '(+ 4 5) 
                     '(* 7 6)
                     '(- (* 2 3) (+ 1 0))
                     '(- (+ 5 8) 12)
                     '(* -2 -6)
                     '(+ (* (- 4 1) -2) 12)
                     '(/ 10 (* 2 (+ 3 1)))
                     ))

@(define e1
   (code #:multi-line #t 
"(EXAMPLE (_______ \"red\")    (circle 10 \"red\"))
(EXAMPLE (_______ \"orange\") (circle 10 \"orange\"))"))

@(define f1
   (code #:multi-line #t
"; mystery : string -> image
(define (mystery c)
  (circle 10 c))"))

@(define e2
   (code #:multi-line #t
"(EXAMPLE (_______ 30) (circle 30 \"red\"))
(EXAMPLE (_______ 10) (circle 10 \"red\"))"))

@(define e3
   (code #:multi-line #t
"(EXAMPLE (_______ 30) (rectangle 30 10 \"red\"))
(EXAMPLE (_______ 10) (rectangle 10 10 \"red\"))"))

@(define e4
   (code #:multi-line #t
"(EXAMPLE (_______ 30) (rectangle 20 30 \"red\"))
(EXAMPLE (_______ 20) (rectangle 20 20 \"red\"))
(EXAMPLE (_______ 10) (rectangle 20 10 \"red\"))"))

@(define e5
   (code #:multi-line #t
"(EXAMPLE (_______ 2) (+ 2 2))
(EXAMPLE (_______ 4) (+ 4 4))
(EXAMPLE (_______ 5) (+ 5 5))
"))

@(define examples-lst
   (list e1 e2 e3 e4 e5 "" ""))

@(define functions-lst
   (list 
    @(code #:multi-line #t "(define (mystery1 r) (circle r \"red\"))")
    @(code #:multi-line #t "(define (mystery2 num) (* num 2))") 
    @(code #:multi-line #t "(define (mystery3 w) (rectangle w 10 \"red\"))")
    @(code #:multi-line #t "(define (mystery4 num) (+ num num))") 
    f1
    @(code #:multi-line #t "(define (mystery6 h) (rectangle 20 h \"red\"))")
    @(code #:multi-line #t "(define (mystery7 h) (rectangle 10 h \"red\"))")
    ))

@(exercise-handout 
  #:title "Matching Examples and Function Definitions"
  #:instr "The left column shows several collections of Examples, but the examples are missing their function names.
           The right column has several functions.  Figure out which function goes with each collection of
           examples.  You might not use all of the functions."

  @;Using matching exercise to override right floats of CoE in CSS
  @(matching-exercise examples-lst functions-lst)) 

