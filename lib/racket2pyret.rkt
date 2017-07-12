#lang racket

; BS1 -> pyret compiler

(provide algebra->pyret
         pyret->string
         algebra->pyret-string
         algebra-string->pyret-string
         )

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

(define (algebra->pyret sexp)
  (cond [(atom? sexp) (make-pyatom sexp)]
        [else 
         (case (first sexp)
           [(+ - * /) (make-pybinop (first sexp) (algebra->pyret (second sexp)) (algebra->pyret (third sexp)))]
           [(define) (let ([defname (first (second sexp))]
                           [args (second (second sexp))]
                           [body (third sexp)])
                       (make-pyfun defname args (algebra->pyret body)))]
           [(cond) (let* ([clauses (rest sexp)]
                          [pyret-clauses 
                           (map (lambda (c) (make-pyask-clause (algebra->pyret (first c)) (algebra->pyret (second c))))
                                clauses)])
                     (make-pyask pyret-clauses))]
           [(example) (let ([testexpr (second sexp)]
                            [output (third sexp)])
                        (make-pyexample (algebra->pyret testexpr) (algebra->pyret output)))]
           [else ;; function application
            (let ([fname (first sexp)]
                  [args (rest sexp)])
              (make-pyapp fname (map algebra->pyret args)))]
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
        [(pyask-clause? pyast) (format " | ~a => ~a~n"
                                       (pyret->string (pyask-clause-test pyast))
                                       (pyret->string (pyask-clause-then pyast)))]
        [(pyask? pyast) (format "ask: ~n ~a ~nend" (string-join (map pyret->string (pyask-clauses pyast)) " "))]
        [(pyexample? pyast) (format "~a is ~a"
                                    (pyret->string (pyexample-in pyast))
                                    (pyret->string (pyexample-out pyast)))]
        [(pyapp? pyast) (format "~a(~a)" 
                                (pyapp-fname pyast)
                                (string-join (map pyret->string (pyapp-args pyast)) ", "))]
        [else (error 'pyret->string "Unknown ast ~a~n" pyast)]))
        
(define (algebra->pyret-string sexp)
  (pyret->string (algebra->pyret sexp)))

(define (algebra-string->pyret-string sexpstr) 
  (algebra->pyret-string (with-input-from-string sexpstr read)))

;; TESTS
(define (test-algebra->pyret expr)
  (display (pyret->string (algebra->pyret expr)))
  (printf "~n~n"))

(define (run-tests)
  (test-algebra->pyret 3)
  (test-algebra->pyret '(+ 2 3))
  (test-algebra->pyret '(define (f x) (+ x 2)))
  (test-algebra->pyret '(example (f x) (+ x 2)))
  (test-algebra->pyret '(cond [(* 4 5) "cake"] [else "pizza"]))
  )