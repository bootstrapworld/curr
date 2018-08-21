#lang curr/lib

@(define e1 (code "big-star(\"purple\")"))
@(define c1 (code "big-star :: String -> Image")) 

@(define e2 (code "big-star(25, \"gold\")"))
@(define c2 (code "big-star :: Number, String -> Image"))

@(define e3 (code "message-cost(15)"))
@(define c3 (code "message-cost :: Number -> Number"))

@(define e4 (code "message-cost(\"where are you?\")"))
@(define c4 (code "message-cost :: String -> Number"))

@(define e5 (code "show-score(\"Red Sox\", 6, \"Cardinals\", 4)"))
@(define c5 (code #:multi-line #t
"show-score :: String, Number, String, 
            Number -> Image"))

@(define e6 (code "show-score(\"Red Sox\", \"Cardinals\", 5, 5)"))
@(define c6 (code #:multi-line #t
"show-score :: String, String, Number, 
            Number -> Image"))
@(define c6a (code "show-score :: String, String -> Image"))
@(define c6b (code "show-score :: String, Number -> Image"))

@(define e7 (code "find-winner(\"Red Sox\", 4, \"Yankees\", 6)"))
@(define c7 (code #:multi-line #t
"find-winner :: String, Number, String, Number 
              -> String"))

@(define e8 (code "pick-flavor(\"vanilla\", \"oreo\", \"mint\")"))
@(define c8 (code #:multi-line #t
"pick-flavor :: String, String, String, 
              -> Image"))

@(define e9 (code "prefer-flavor(\"lemon\", \"lime\")"))
@(define c9 (code "prefer-flavor :: String, String -> Number"))
@(define c9a (code "choose-flavor :: String, String -> String"))

@(define examples-lst (list e1 e2 e3 e4 e5 e6 e7 e8 e9))
@(define correct-ans (list c1 c2 c3 c4 c5 c6 c7 c8 c9))
@(define permuted-ans (list c2 c4 c3 c6a c6b c5 c9 c9a c8))

@(exercise-handout
  #:title "Matching Expressions and Contracts"
  #:instr "Can you guess the contract for a function just by seeing how it's used?
           Try to match each Expression in the left column with a Contract in the right column 
           that describes the function being used.  Some expressions or contracts
           might not have a match."
  #:forevidence (exercise-evid-tags "BS-PL.3&1&2" "BS-DR.2&1&2" "F-IF.1-3&1&1" "F-IF.1-3&1&3")
  @(matching-exercise examples-lst permuted-ans)
  @(exercise-answers
    (matching-exercise-answers 
      #:some-no-match? #t
      examples-lst correct-ans permuted-ans))
  )
