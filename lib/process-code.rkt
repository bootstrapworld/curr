#lang racket

(require scribble/base
         scribble/basic
         scriblib/render-cond
         "styles.rkt"
         "racket2pyret.rkt"
         "sxml.rkt"
         )

(provide sexp
         sexp->block ; used in gen-arith-exp in form-elements
         code
         code/CSS
	 sexp->coe
         sexp->code         
         )

;;;;;;; styles ;;;;;;;;;;;;;;;;;;;;;;;

(define bs-numvalue-style (bootstrap-span-style "value wescheme-number"))
(define bs-strvalue-style (bootstrap-span-style "value wescheme-string"))
(define bs-symvalue-style (bootstrap-span-style "value wescheme-symbol"))
(define bs-boolvalue-style (bootstrap-span-style "value wescheme-boolean"))
(define bs-clause-style (bootstrap-span-style "wescheme-clause"))
(define bs-comment-style (bootstrap-div-style "wescheme-comment"))
(define bs-expr-hole-style (bootstrap-span-style "studentAnswer"))
(define bs-example-style (bootstrap-span-style "wescheme-example"))
(define bs-example-left-style (bootstrap-span-style "wescheme-example-left"))
(define bs-example-right-style (bootstrap-span-style "wescheme-example-right"))
(define bs-keyword-style (bootstrap-span-style "wescheme-keyword"))
(define bs-openbrace-style (bootstrap-span-style "lParen"))
(define bs-closebrace-style (bootstrap-span-style "rParen"))
(define bs-operator-style (bootstrap-span-style "operator"))
(define bs-expression-style (bootstrap-span-style "expression"))
(define bs-define-style (bootstrap-span-style "wescheme-define"))
(define bs-sexp-style (bootstrap-div-style "codesexp"))
(define bs-code-style (bootstrap-div-style "code"))
(define bs-circeval-style (bootstrap-div-style "circleevalsexp"))

;;;;;; DOM-based sexps ;;;;;;;;;;;;;;;;;;;;;;;

(define EXPR-HOLE-SYM 'BSLeaveAHoleHere)
(define EXPR-HOLE-SYM2 'BSLeaveAHoleHere2)
(define EXPR-HOLE-SYM3 'BSLeaveAHoleHere3)

;; converts sexp into structured markup
;; believe symbols only go to the first list case, not the symbol? case
;; recognizes EXPR-HOLE-SYM (used to create partially-completed expressions)
;;   in each of atom and operator positions
(define (sexp->block/aux sexp)
  (cond [(member sexp '(true false))
         (elem #:style bs-boolvalue-style (format "~a" sexp))]
        [(eq? sexp 'else) (elem #:style bs-keyword-style "else")]
        [(eq? sexp EXPR-HOLE-SYM)  (elem #:style bs-expr-hole-style " ")]
        [(eq? sexp EXPR-HOLE-SYM2) (elem #:style bs-expr-hole-style (elem #:style bs-expr-hole-style " "))]
        [(eq? sexp EXPR-HOLE-SYM3) (elem #:style bs-expr-hole-style 
                                         (elem #:style bs-expr-hole-style 
                                               (elem #:style bs-expr-hole-style " ")))]
        [(number? sexp) (elem #:style bs-numvalue-style (format "~a" sexp))]
        [(string? sexp) (elem #:style bs-strvalue-style (format "~s" sexp))]
        [(symbol? sexp) (elem #:style bs-symvalue-style (format "~a" sexp))]
        [(boolean? sexp) (elem #:style bs-boolvalue-style (format "~a" sexp))]
        [(and (list? sexp) (eq? 'quote (first sexp)))
         (elem #:style bs-symvalue-style (format "'~a" (second sexp)))]
        [(list? sexp)
         (case (first sexp)
           [(cond) 
            (let ([clauses (map (lambda (clause) 
                                  (elem #:style bs-clause-style
                                        (list (elem #:style bs-openbrace-style "[") 
                                              (sexp->block/aux (first clause))
                                              (sexp->block/aux (second clause))
                                              (elem #:style bs-closebrace-style "]")))) 
                                (rest sexp))])
              (elem #:style bs-expression-style
                    (append
                     (list 
                      (elem #:style bs-openbrace-style "(") 
                      (elem #:style bs-keyword-style "cond"))
                     clauses
                     (list (elem #:style bs-closebrace-style ")")))))]
           [(EXAMPLE example Example) 
            (elem #:style bs-example-style
             (list (elem #:style bs-openbrace-style "(") 
                   (elem #:style bs-keyword-style "EXAMPLE")
                   (elem #:style bs-example-left-style (sexp->block/aux (second sexp)))
                   (elem #:style bs-example-right-style (sexp->block/aux (third sexp)))
                   (elem #:style bs-closebrace-style ")")))]
           [(define) 
            (elem #:style bs-define-style
                  (list (elem #:style bs-openbrace-style "(") 
                        (elem #:style bs-keyword-style "define")
                        (sexp->block/aux (second sexp))
                        (sexp->block/aux (third sexp))
                        (elem #:style bs-closebrace-style ")")))]
           [else ;; have a function call
            (let ([args (map sexp->block/aux (rest sexp))])
              (elem #:style bs-expression-style
                    (append
                     (list (elem #:style bs-openbrace-style "(") 
                           (elem #:style bs-operator-style 
                                 (if (eq? (first sexp) EXPR-HOLE-SYM) " " (format "~a " (first sexp)))))
                     args 
                     (list (elem #:style bs-closebrace-style ")")))))])]
        [else (error 'sexp->block 
                     (format "Unrecognized expression type for ~a~n" sexp))]))

(define (sexp->block sexp form)
  (let ([style (if (string=? form "sexp") bs-sexp-style bs-circeval-style)])
    ;; changed from elem to para
    (para #:style style (sexp->block/aux sexp))))

;; convert an sexpression into structured form.  In some contexts,
;;   Scribble sends data in as strings, so may need to parse string into an sexp
;;   prior to traversal/rendering
(define (sexp exp-perhaps-as-string #:form (form "circofeval"))
  (unless (member form (list "code" "text" "circofeval"))
    (error 'sexp "Unrecognized form ~a~n" form))
  (let ([exp (if (string? exp-perhaps-as-string) 
                 (with-input-from-string exp-perhaps-as-string read) 
                 exp-perhaps-as-string)])
    (if (member form (list "code" "text"))
        (sexp->block exp "sexp")
        (sexp->block exp form))))

;; yields an error that + is an undefined identifier
(define (sexp-answer sexp)
  (let ([exp (if (string? sexp)
                 (with-input-from-string sexp read)
                 sexp)])
    (eval exp)))

;; check whether line starts with ; to indicate a code comment
(define (comment-line? aline)
  (char=? (string-ref aline 0) #\;))

;; takes a string containing one or more sexps and returns list of sexps
(define (read-sexps-from-string codestr)
  (let ([p (open-input-string codestr)])
    (let loop ()
      (let ([exp (read p)])
        (if (eof-object? exp)
            (begin (close-input-port p) empty)
            (cons exp (loop)))))))

(define (sexp->coe e)
  (sexp #:form "circofeval" e))

(define (sexp->code e)
  (sexp #:form "code" e))

;;;;;;;;;; Formatting blocks of code ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
          
;; assumes that all comment lines come at the beginning of the list
(define (code->block list-of-lines)
  (let ([list-of-sexps-and-comments
         (let loop ([lines list-of-lines])
           (cond [(empty? lines) empty]
                 [(comment-line? (first lines))
                  (cons (elem #:style bs-comment-style (first lines))
                        (loop (rest lines)))]
                 [(string=? (first lines) "\n") (loop (rest lines))]
                 [else (map (lambda (expstr) (sexp->block expstr "sexp"))
                            (read-sexps-from-string (string-join lines)))]))])
    (nested #:style bs-code-style list-of-sexps-and-comments)))

;; generate tags to format code via codemirror
(define (code/CSS #:multi-line (multi-line #f)
              #:malformed? (malformed? #f)
              #:contract (contract #f)
              #:purpose (purpose #f)
              . body)
  ;; first an error check to make sure we understand original API usage
  (when (and (not multi-line) (or (and contract purpose) 
                                  (and contract (not (null? body))) 
                                  (and purpose (not (null? body)))))
    (printf "WARNING: Use of code that supplied more than one of contract/purpose/body~n"))
  (let ([make-comment (lambda (str) (string-append "; " str "\n"))])
    (with-handlers
        ([exn:fail:read?
          ;; for now, assuming only malformed are simple compositional exprs: 
          ;;    no cond, define, etc
          (lambda (e) (elem #:style bs-code-style body))])
      (code->block
       (append (if contract (list (make-comment contract)) empty)
               (if purpose (list (make-comment purpose)) empty)
               body)))))

;; generate tags to format code via codemirror
;; pyret-alt lets us manually provide the pyret code to insert in place of
;;   the provided body.  This will be used for content that cannot be
;;   read as sexps, such as malformed expressions used to teach about error messages
(define (code #:multi-line (multi-line #f)
              #:contract (contract #f)
              #:purpose (purpose #f)
              #:lang (lang (getenv "TARGET-LANG"))
              ;#:pyret-alt (pyret-alt #f)
              . body)
  ;; first an error check to make sure we understand original API usage
  (when (and (not multi-line) (or (and contract purpose) 
                                  (and contract (not (null? body))) 
                                  (and purpose (not (null? body)))))
    (printf "WARNING: Use of code that supplied more than one of contract/purpose/body~n"))
  (let ([allcode (string-append (if contract (string-append (curr-comment-char) " " contract "\n") "")
                                (if purpose (string-append (curr-comment-char) " " purpose "\n") "")
                                (apply string-append body)
                                ;(cond [(gen-racket?) (apply string-append body)]
                                ;      [(gen-pyret?) (apply string-append (map bs1-string->pyret-string body))]
                                ;      [else (error 'code "Unknown target language")])
                                )])
    ;; we do not use the built-in Racket code formatting in order
    ;; to let codemirror can handle it instead
    ;; the nbsp is there to hack around a rendering error that occurs when
    ;; an activity is immediately followed by code
    (cond-element 
     [html (if multi-line 
               (elem (list (sxml->element 'nbsp) (sxml->element `(textarea (@ (class ,lang)) ,(string-append "\n" allcode "\n")))))
               (sxml->element `(tt (@ (class ,lang)) ,allcode)))]               
     [else allcode])))

;;; tailoring to pyret vs racket

(define (gen-racket?)
  (equal? (getenv "TARGET-LANG") "racket"))

(define (gen-pyret?)
  (equal? (getenv "TARGET-LANG") "pyret"))

(define (curr-comment-char)
  (cond [(gen-pyret?) "#"]
        [(gen-racket?) ";"]
        [else (error 'curr-comment "Current target lang unclear")]))