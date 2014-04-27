#lang racket

; BS1 -> pyret compiler

(define binop-table
  '((+ plus)
    (- minus)
    (* times)
    (/ div)))

(define (lookup-binop b)
  (second (assq b binop-table)))

(define (atom? v) (not (list? v)))

(define (bs1->pyret sexp)
  (if (atom? sexp) (format "~s" sexp)
      (case (first sexp)
        [(+ - * /) (format "~a(~a, ~a)" (lookup-binop (first sexp)) (second sexp) (third sexp))]
        [(define) (let ([defname (first (second sexp))]
                        [args (second (second sexp))]
                        [body (third sexp)])
                    (format "fun ~a(~a): ~n ~a ~nend" defname args (bs1->pyret body)))]
        [(cond) (let* ([clauses (rest sexp)]
                       [pyret-clauses 
                        (map (lambda (c) (format " | ~a => ~a"
                                                 (bs1->pyret (first c)) (bs1->pyret (second c))))
                             clauses)])
                  (format "ask: ~n ~a ~nend" (string-join pyret-clauses "~n ")))]
        [(example) (let ([testexpr (second sexp)]
                         [output (third sexp)])
                     (format "~a is ~a" (bs1->pyret testexpr) (bs1->pyret output)))]
        [else ;; function application
         (let ([fname (first sexp)]
               [args (rest sexp)])
           (format "~a(~a)" fname (string-join (map bs1->pyret args) ", ")))]
        )))
        
        
;; TESTS
(define (test-bs1->pyret expr)
  (printf (bs1->pyret expr))
  (printf "~n~n"))

(test-bs1->pyret 3)
(test-bs1->pyret '(+ 2 3))
(test-bs1->pyret '(define (f x) (+ x 2)))
(test-bs1->pyret '(example (f x) (+ x 2)))
(test-bs1->pyret '(cond [(* 4 5) "cake"] [else "pizza"]))