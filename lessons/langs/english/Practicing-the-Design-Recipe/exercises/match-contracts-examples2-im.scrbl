#lang curr/lib 

@(define e5a
   (code #:multi-line #t
"examples:
match(30) is
    star((30 * 2), \"outline\", \"purple\")"))
   
@(define e5b
   (code #:multi-line #t
"examples:
match(24) is
     star((24 * 2), \"outline\", \"purple\")")) 

@(define e6a
   (code #:multi-line #t
"examples:
match(triangle(20, \"solid\", \"pink\"), 3) is
      3 * image-height( 
          triangle(20, \"solid\", \"pink\"))"))
   
@(define e6b
   (code #:multi-line #t
"examples:
match(circle(10, \"solid\", \"red\"), 16) is
     16 * image-height( 
          circle(10, \"solid\", \"red\"))"))

@(define e7a
   (code #:multi-line #t
"examples:
match(\"triangle\", \"blue\") is
         triangle(40, \"outline\", \"blue\")"))

@(define e8a
   (code #:multi-line #t
"examples:
match(string-length(\"coffee\"),
                string-length(\"tea\")) is
         6 + 3"))



@(define e9a
   (code #:multi-line #t
"examples:
match(string-length(\"tabletop\")) is
         \"8\""))

@(define e9b
   (code #:multi-line #t
"examples:
match(1.50) is
      \"greater than 1\""))

@(define c5 (code " match :: number -> image"))
@(define c6 (code " match :: image number -> number"))
@(define c7 (code " match :: string string -> image"))
@(define c8 (code " match :: number number -> number"))
@(define c9 (code " match :: number -> string"))

@(define answer-key
   (list  (list e5a c5)
          (list e5b c5)
          (list e6a c6)
          (list e6b c6)
          (list e7a c7)
          (list e8a c8)
          (list e9a c9)
          (list e9b c9)
          ))

@(define ques (map car answer-key))
@(define ans (map cadr answer-key))
@(define permuted-ans (list c8 c9 c7 c5 c6))

@(exercise-handout
  #:title "Matching Contracts and Examples"
  #:instr "Match each Example on the left with the Contract on the right. NOTE: Multiple examples 
           may match to the same contract!"
  #:forevidence (exercise-evid-tags "BS-DR.2&1&2" "F-IF.1-3&1&1" "F-IF.1-3&1&2")
  @(matching-exercise ques permuted-ans)
  @(exercise-answers 
     (matching-exercise-answers ques ans permuted-ans))
)

