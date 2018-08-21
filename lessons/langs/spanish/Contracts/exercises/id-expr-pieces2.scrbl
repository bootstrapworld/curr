#lang curr/lib

@(define q11 (elem "What is the " @vocab{name} " of the innermost function being used in" @code{ string-length("broccoli") + 8} "?"))
@(define a11 "string-length")

@(define q13 (elem "What is the " @vocab{domain} " of the outermost function being used in" @code{ scale(2, circle(40, "solid", "blue"))} "?"))
@(define a13 "number image")

@(define q12 (elem "What is the " @vocab{domain} " of the innermost function being used in" @code{ scale(2, circle(40, "solid", "blue"))} "?"))
@(define a12 "number string string")

@(define q14 (elem "How many " @vocab{arguments} " does the + function take in " @code{ string-length("broccoli") + 8} "?"))
@(define a14 "2")

@(define q15 (elem "What is the " @vocab{range} " of the function string-length?"))
@(define a15 "number")

@(define q16 (elem "Is text a " @vocab{string} ", a " @vocab{function} ", or an " @vocab{image} "?"))
@(define a16 "function")

@(define q17 (elem "Is the range of text a " @vocab{string} " or an " @vocab{image} "?"))
@(define a17 "image")

@(define q18 (elem "What is the first " @vocab{argument} " to the " @code{circle} " function in" @code{ scale(2, circle(40, "solid", "blue"))} "?"))
@(define a18 "40")

@(define q19 (elem "Do the " @code{rectangle} " and the " @code{square} " function have the same " @vocab{domain} "?"))
@(define a19 "No. The domain of rectangle is number number string string and the domain of square is number string string.")


@(define ques (list q11 q13 q12 q14 q15 q16 q17 q18 q19))
@(define ans  (list a11 a13 a12 a14 a15 a16 a17 a18 a19))

@(exercise-handout 
  #:title "Identifying Parts of Expressions"
  #:instr "Answer each of the following questions in the space provided:"
  #:forevidence (exercise-evid-tags "BS-PL.2&1&1" "BS-PL.2&1&3")
  @(open-response-exercise ques "text")
  @(exercise-answers (questions-and-answers ques ans))
  )
