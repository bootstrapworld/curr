#lang curr/lib

@(define exprs '((* (- 4 24) (+ 13 25))
                 (- (- 14 13) 14)
                 (- (+ 7 20) (* 16 9))
                 (* (- 6 16) 14)
                 (* (- 14 6) 16)
                 (+ (+ 14 20) 5)
                 (+ (- 8 11) 5)
                 (- (+ 8 11) 5)
                 (- 5 (+ 8 11))
                 (* (+ 19 20) (- (+ 12 10) 22))
                 (* 14 (+ 6 4))
                 (- 22 (* 7 (* 6 10)))
                 (* (+ 8 21) (+ 20 9)))
   )

@(exercise-handout 
  #:title "Evaluating Circles of Evaluation"
  #:instr "For each Circle of Evaluation below, evaluate the Circle and 
   write down the answer (a number):"
  @(circeval-matching-exercise/code 
    (map (lambda (s) (format "~a" s)) exprs)))
