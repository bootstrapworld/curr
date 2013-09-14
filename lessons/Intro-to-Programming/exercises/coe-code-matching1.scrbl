#lang curr/lib

@(define exprs '((* (- 4 24) (+ 13 25))
                 (- (- 14 13) 14)
                 (* (- 6 16) 14)
                 (* 16 (- 14 6))
                 (+ (- 8 11) 5)
                 (- (+ 8 11) 5)
                 (* (+ 19 20) (- (+ 12 10) 22))
                 (- 22 (* 7 (* 6 10)))
                 ))

@(define permuted-exprs 
               '((- (+ 8 11) 5)
		 (- (- 14 13) 14)
                 (- 22 (* 7 (* 6 10)))
                 (* 16 (- 14 6))
                 (* (- 6 16) 14)
                 (+ (- 8 11) 5)
		 (* (- 4 24) (+ 13 25))
		 (* (+ 19 20) (- (+ 12 10) 22))
                 ))

@(exercise-handout 
  #:title "Matching Circles of Evaluation and Code"
  #:instr "For each Circle of Evaluation in the left column, match it with its corresponding code from the right column."
  @(matching-exercise 
    (map sexp exprs)
    (map (lambda (e) (sexp #:form "code" e)) permuted-exprs)))
