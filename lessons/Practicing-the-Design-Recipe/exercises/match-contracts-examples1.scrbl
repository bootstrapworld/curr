#lang curr/lib 

@(define e1a
   (code #:multi-line #t
"(EXAMPLE (match-me 30 \"red\")
         (+ 30 (string-length \"red\")))"))

@(define e1b
   (code #:multi-line #t
"(EXAMPLE (match-me 10 \"blue\")
         (+ 10 (string-length \"blue\")))"))

@(define e2a
   (code #:multi-line #t
"(EXAMPLE (match-me (triangle 20 \"outline\" \"brown\") 3)
         (scale 3 (triangle 20 \"outline\" \"brown\")))"))

@(define e2b
   (code #:multi-line #t
"(EXAMPLE (match-me (circle 10 \"solid\" \"orange\") 22)
         (scale 22 (circle 10 \"solid\" \"orange\"))"))

@(define e3a
   (code #:multi-line #t
"(EXAMPLE (match-me 5 (triangle 20 \"solid\" \"yellow\"))
         (rotate (- 90 5) (triangle 20 \"solid\" \"yellow\")))"))

@(define e3b
   (code #:multi-line #t
"(EXAMPLE (match-me 73 (star 10 \"outline\" \"orange\") 22)
         (rotate (- 90 73) (star 10 \"outline\" \"orange\"))"))

@(define e4a
   (code #:multi-line #t
"(EXAMPLE (match-me (circle 20 \"outline\" \"brown\"))
         (rotate 37 (circle 20 \"outline\" \"brown\")))"))

@(define e4b
   (code #:multi-line #t
"(EXAMPLE (match-me (circle 10 \"solid\" \"green\"))
         (rotate 37 (circle 10 \"solid\" \"green\"))"))

@(define e5a
   (code #:multi-line #t
"(EXAMPLE (match-me 30)
         (star (* 30 2) \"outline\" \"purple\"))"))
   
@(define e5b
   (code #:multi-line #t
"(EXAMPLE (match-me 24)
         (star (* 24 2) \"outline\" \"purple\"))"))

@(define e6a
   (code #:multi-line #t
"(EXAMPLE (match-me (triangle 20 \"outline\" \"brown\") 3)
         (* 3 (image-height (triangle 20 \"outline\" \"brown\"))))"))
   
@(define e6b
   (code #:multi-line #t
"(EXAMPLE (match-me (circle 10 \"solid\" \"silver\") 16)
         (* 16 (image-height (circle 10 \"solid\" \"silver\"))"))

@(define c1 (code "; match-me : number string -> number"))
@(define c2 (code "; match-me : image number -> image"))
@(define c3 (code "; match-me : number image -> image"))
@(define c4 (code "; match-me : image -> image"))
@(define c5 (code "; match-me : number -> image"))
@(define c6 (code "; match-me : image number -> number"))

@(exercise-handout
  #:title "Matching Contracts and Examples"
  #:instr "Match each Example in the left column with the Contract in the right column 
           that has the domain and range used in the example.  Multiple examples 
           may match to the same contract."
  @(matching-exercise
    (list e1a e1b e2a e2b e3a e4a e4b e5a e6b)
    (list c1 c2 c3 c4 c5 c6)))
