#lang racket

; BS1 -> pyret compiler

(provide bs1->pyret)

;--------- PYRET AST -----------
(define-struct pyatom (a))
(define-struct pybinop (b l r))
(define-struct pyfun (name args body))
(define-struct pyask-clause (test then))
(define-struct pyask (clauses))
(define-struct pyexample (in out))
(define-struct pyapp (fname args))

;--------- BINOPS --------------
(define binop-table
  '((+ plus)
    (- minus)
    (* times)
    (/ div)))

(define (lookup-binop b)
  (second (assq b binop-table)))

(define (atom? v) (not (list? v)))

(define (bs1->pyret sexp)
  (cond [(atom? sexp) (make-pyatom sexp)]
        [else 
         (case (first sexp)
           [(+ - * /) (make-pybinop (first sexp) (bs1->pyret (second sexp)) (bs1->pyret (third sexp)))]
           [(define) (let ([defname (first (second sexp))]
                           [args (second (second sexp))]
                           [body (third sexp)])
                       (make-pyfun defname args (bs1->pyret body)))]
           [(cond) (let* ([clauses (rest sexp)]
                          [pyret-clauses 
                           (map (lambda (c) (make-pyask-clause (bs1->pyret (first c)) (bs1->pyret (second c))))
                                clauses)])
                     (make-pyask pyret-clauses))]
           [(example) (let ([testexpr (second sexp)]
                            [output (third sexp)])
                        (make-pyexample (bs1->pyret testexpr) (bs1->pyret output)))]
           [else ;; function application
            (let ([fname (first sexp)]
                  [args (rest sexp)])
              (make-pyapp fname (map bs1->pyret args)))]
           )]))

(define (pyret->string pyast)
  (cond [(pyatom? pyast) (let ([a (pyatom-a pyast)])
                           (if (string? a) a (format "~a" a)))]
        [(pybinop? pyast) (format "~a(~a, ~a)" 
                                  (lookup-binop (pybinop-b pyast)) 
                                  (pyret->string (pybinop-l pyast)) 
                                  (pyret->string (pybinop-r pyast)))]
        [(pyfun? pyast) (format "fun ~a(~a): ~n ~a ~nend" 
                                (pyfun-name pyast) 
                                (pyfun-args pyast)
                                (pyret->string (pyfun-body pyast)))]
        [(pyask-clause? pyast) (format " | ~a => ~a"
                                       (pyret->string (pyask-clause-test pyast))
                                       (pyret->string (pyask-clause-then pyast)))]
        [(pyask? pyast) (format "ask: ~n ~a ~nend" (string-join (map pyret->string (pyask-clauses pyast)) "~n "))]
        [(pyexample? pyast) (format "~a is ~a"
                                    (pyret->string (pyexample-in pyast))
                                    (pyret->string (pyexample-out pyast)))]
        [(pyapp? pyast) (format "~a(~a)" 
                                (pyapp-fname pyast)
                                (string-join (map pyret->string (pyapp-args pyast)) ", "))]
        [else (error 'pyret->string "Unknown ast ~a~n" pyast)]))
        
;; TESTS
(define (test-bs1->pyret expr)
  (display (pyret->string (bs1->pyret expr)))
  (printf "~n~n"))

(test-bs1->pyret 3)
(test-bs1->pyret '(+ 2 3))
(test-bs1->pyret '(define (f x) (+ x 2)))
(test-bs1->pyret '(example (f x) (+ x 2)))
(test-bs1->pyret '(cond [(* 4 5) "cake"] [else "pizza"]))