#lang curr/lib 

@(define e1a
   (code #:multi-line #t
"(EXAMPLE (match 30 \"red\")
         (+ 30 (string-length \"red\")))"))

@(define e1b
   (code #:multi-line #t
"(EXAMPLE (match 10 \"blue\")
         (+ 10 (string-length \"blue\")))"))

@(define e1c 
   (code #:multi-line #t
"(EXAMPLE (match (abs -4) \"45\")
          4)"))

@(define e2a
   (code #:multi-line #t
"(EXAMPLE (match (triangle 20 \"solid\" \"blue\") 
                3)
         (scale 3 (triangle 20 \"solid\"
                               \"blue\")))"))

@(define e2b
   (code #:multi-line #t
"(EXAMPLE (match (circle 10 \"solid\" \"orange\") 
                22)
         (scale 22 
                (circle 10 \"solid\" \"orange\")))"))

@(define e2c 
   (code #:multi-line #t
"(EXAMPLE (match (bitmap/url \"image.com/flower\")
                 3))
          (rotate 3
                 (bitmap/url \"image.com/flower\")))"))

@(define e3a
   (code #:multi-line #t
"(EXAMPLE (match 5 (star 20 \"solid\" \"red\"))
         (rotate (- 90 5) 
                 (star 20 \"solid\" \"red\")))"))

@(define e3b
   (code #:multi-line #t
"(EXAMPLE (match 73 (star 10 \"outline\" \"orange\") 22)
         (rotate (- 90 73) (star 10 \"outline\" \"orange\")))"))

@(define e4a
   (code #:multi-line #t
"(EXAMPLE (match (circle 20 \"outline\" \"gold\"))
         (rotate 37 (circle 20 \"outline\" 
                              \"gold\")))"))

@(define e4b
   (code #:multi-line #t
"(EXAMPLE (match (circle 10 \"solid\" \"green\"))
         (rotate 37 
                 (circle 10 \"solid\" \"green\")))"))

@(define e5a
   (code #:multi-line #t
"(EXAMPLE (match 30)
         (star (* 30 2) \"outline\" \"purple\"))"))
   
@(define e5b
   (code #:multi-line #t
"(EXAMPLE (match 24)
         (star (* 24 2) \"outline\" \"purple\"))"))

@(define e5c 
   (code #:multi-line #t
"(EXAMPLE (match (* 7 8))
         (text \"56\" 50 \"blue\"))")) 

@(define e6a
   (code #:multi-line #t
"(EXAMPLE (match (triangle 20 \"outline\" \"brown\") 3)
          (* 3 
            (image-height 
               (triangle 20 \"outline\" \"brown\"))))"))
   
@(define e6b
   (code #:multi-line #t
"(EXAMPLE (match (circle 10 \"solid\" \"silver\") 
                16)
         (* 16 
            (image-height 
                (circle 10 \"solid\" \"silver\"))))"))

@(define e7a
   (code #:multi-line #t
"(EXAMPLE (match \"triangle\" \"blue\")
         (triangle 40 \"outline\" \"blue\"))"))

@(define e7b
   (code #:multi-line #t
"(EXAMPLE (match \"dog\" 
                \"images.com/dog\")
          (bitmap/url \"images.com/dog\"))"))

@(define e8a
   (code #:multi-line #t
"(EXAMPLE (match (string-length \"coffee\") 
                 (string-length \"tea\"))
         (+ 6 3))"))

@(define e8b
   (code #:multi-line #t
"(EXAMPLE (match (sqrt 25) (sqrt 81))
          (abs (- 81 25)))"))

@(define e9a
   (code #:multi-line #t
"(EXAMPLE (match (string-length \"tabletop\"))
         \"8\")"))

@(define e9b
   (code #:multi-line #t
"(EXAMPLE (match 1.50)
         \"greater than 1\")"))

@(define c1 (code "; match : number string -> number"))
@(define c2 (code "; match : image number -> image"))
@(define c3 (code "; match : number image -> image"))
@(define c4 (code "; match : image -> image"))
@(define c5 (code "; match : number -> image"))
@(define c6 (code "; match : image number -> number"))
@(define c7 (code "; match : string string -> image"))
@(define c8 (code "; match : number number -> number"))
@(define c9 (code "; match : number -> string"))

@(define answer-key
    (list (list e1a c1)
          (list e1b c1)
          (list e1c c1)
          (list e2a c2)
          (list e2b c2)
          (list e2c c2)
          (list e3a c3)
          (list e4a c4)
          (list e4b c4)
          (list e5a c5)
          (list e5b c5)
          (list e5c c5)
          (list e6a c6)
          (list e6b c6)
          (list e7a c7)
          (list e7b c7)
          (list e8a c8)
          (list e8b c8)
          (list e9a c9)
          (list e9b c9)
          ))

@(define ques (map car answer-key))
@(define ans (map cadr answer-key))
@(define permuted-ans (list c4 c8 c1 c3 c9 c7 c5 c6 c2))

@(exercise-handout
  #:title "Matching Contracts and Examples"
  #:instr "Match each Example on the left with the Contract on the right. NOTE: Multiple examples 
           may match to the same contract!"
  #:forevidence (exercise-evid-tags "BS-DR.2&1&2" "F-IF.1-3&1&1" "F-IF.1-3&1&2")
  @(matching-exercise ques permuted-ans)
  @(exercise-answers 
     (matching-exercise-answers ques ans permuted-ans))
)

