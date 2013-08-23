#lang curr/lib

@(define exprs '((- 4 (- 6 17))
		 (- (+ 25 14) 12)	
		 (+ 1 (* 15 5))
		 (* (+ 2 17) (- 12 8))
		 (* (* 23 14) (+ 3 20))
		 (+ (- 5 17) (* 14 5))
		 (* 9 (+ 17 2))
		 (- 19 (+ 12 11))
		 ))

@title{Exercise: Creating Circles of Evaluation}

@(exercise-handout 
  #:instr "For each math expression below, write down its Circle of Evaluation:"
  @(create-itemlist #:ordered #t #:style "exercise"
    (map sexp->arith-str exprs)))

@(copyright)