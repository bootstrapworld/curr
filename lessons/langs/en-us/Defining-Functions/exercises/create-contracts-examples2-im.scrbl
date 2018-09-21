#lang curr/lib

@(define e8
   (code #:multi-line #t
"examples:
 third-root(16) is num-expt(16, 1/3)
 third-root(125) is num-expt(125, 1/3)
 third-root(625) is num-expt(625, 1/3)
end"))
@(define c8 (code "third-root :: Number -> Number"))

@(define e9
   (code #:multi-line #t
"examples:
 sentence-length(\"hello\", 5) is
          (string-length(\"hello\") + 5)
 sentence-length(\"please\", 6) is
          (string-length(\"please\") + 6)
 sentence-length(\"goodbye\", 10) is
          (string-length(\"please\") +  10)
end"))
@(define c9 (code "sentence-length :: String, Number -> Number"))

@(define e10
   (code #:multi-line #t
"examples:
 upside-down(triangle(50, \"solid\", \"yellow\")) is
          rotate(180, triangle(50, \"solid\", \"yellow\"))
 upside-down(star(150, \"outline\", \"blue\")) is
          rotate(180, star(150, \"outline\", \"blue\"))
end"))
@(define c10 (code "upside-down :: Image -> Image"))

@(define e11
   (code #:multi-line #t
"examples:
 product-squared(5, 6) is num-sqr(5 * 6)
 product-squared(10, 17) is num-sqr(10 * 17)
 product-squared(2, 5) is num-sqr(2 * 5)
end"))
@(define c11 (code "product-squared :: Number, Number -> Number"))

@(define e12
   (code #:multi-line #t
"examples:
 half-image(\"www.images.com/cat_image\") is
          scale(0.5, (bitmap/url \"www.images.com/cat_image\"))
 half-image(\"www.images.com/dog_image\") is
          scale(0.5, (bitmap/url \"www.images.com/dog_image\")))
end"))
@(define c12 (code "half-image :: String -> Image"))

@(define e13
   (code #:multi-line #t
"examples:
 triple(4) is (4 * 3)
 triple(10) is (10 * 3)
 triple(3) is (3 * 3)
end"))
@(define c13 (code "triple :: Number -> Number"))

@(define examples-lst (list e8 e9 e10 e11 e12 e13))
@(define answers-lst (list c8 c9 c10 c11 c12 c13))
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
