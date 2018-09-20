#lang racket

(require scribble/base
         scribble/core
         scribble/decode
         scribble/basic
         (prefix-in manual: scribble/manual)
         scribble/html-properties
         scribble/latex-properties
         scriblib/render-cond
         "scribble-helpers.rkt"
         "styles.rkt"
         "sxml.rkt"
         "escape-values.rkt"
         "build-modes.rkt"
         "translator.rkt"
         )

(provide design-recipe-exercise
         assess-design-recipe
         )

;;;;;;;;; API for Design Receipe Exercises ;;;;;;;;;;;;;;;;;;;;;

(define htmlRarr (cond-element [html (sxml->element 'rarr)] [else "->"]))

;; retrieves info on whether to show named component from given spec
;; currently, spec is either a boolean or a list of three booleans
;;   corresponding to the funname, input, or output, respectively
(define (show-example-component? spec comp)
  (let [(pos (case comp 
               [(funname) first]
               [(input) second]
               [(output) third]))]
    (or (and (boolean? spec) spec) 
        (and (cons? spec) (pos spec)))))

;; a wrapper for design-recipe-exercise that shows all fields and allows some
;; components to have errors (rather than be generated from good data such as the
;; function name).  See design-recipe-exercise docs for parameter documentation
(define (assess-design-recipe funname directions
                              #:domain-list (domain-list '()) ; list of string
                              #:range (range #f)
                              #:purpose (purpose #f)
                              #:example-list (example-list '()) ;concrete examples -- see doc above func for details
                              #:buggy-example-list (buggy-example-list '()) ; full concrete examples with error
                              #:buggy-funname-defn (buggy-funname-defn #f)
                              #:param-list (param-list '()) ; list of string
                              #:body (body #f) ; a string
                              #:grid-lines? (grid-lines? #f)
                              )
  ;; checks that all components have been provided actual values
  (unless range (error 'assess-design-recipe "range required"))
  (unless purpose (error 'assess-design-recipe "purpose required"))
  (unless body (error 'assess-design-recipe "body required"))
  (let ([use-examples (if (cons? buggy-example-list) buggy-example-list example-list)])
    (design-recipe-exercise funname directions
                            #:page-header (string-append (translate 'design-title)":")
                            #:show-funname-contract? #t
                            #:domain-list domain-list
                            #:show-domains? #t 
                            #:range range
                            #:show-range? #t
                            #:purpose purpose
                            #:show-purpose? #t
                            #:num-examples (length use-examples)
                            #:example-list example-list 
                            #:buggy-example-list buggy-example-list 
                            #:show-examples (build-list (length use-examples) (lambda (i) #t)) 
                            #:buggy-funname-defn buggy-funname-defn
                            #:show-funname-defn? #t
                            #:param-list param-list
                            #:show-params? #t 
                            #:body body
                            #:show-body? #t
                            #:grid-lines? grid-lines?
                            )))

                            

;; Create a design-recipe exercise
;;   funname: string naming the function
;;   directions: instructions for the problem 
;; num-examples says how many examples to generate.  Some of the examples may be specified
;;   by populating the example-list and configuring show-examples (keep reading)
;; example-list is a list of lists giving the input and output: e.g., (list (list 5 '(* 5 2)))
;;   the list contents can be num/string/sexp -- anything that format can convert to a string
;;   - for Pyret, answers are intentionally generated with #:fmt-quotes #f,
;;     so be sure to format your examples with args of any kind, then a single string as the
;;     answer. The above example would be (list (list 5 "5 * 2"))
;; answer: ie 
;; show-examples is a list of configurations of which parts of each elt in example-list to show
;;    - each configuration is either a boolean or a list of three booleans
;;    - e.g., show-examples of (list #f (list #t #f #t) #t) says
;;      * don't show any components of the first example in example-list
;;      * show the function name and output of the second example in example-list
;;      * show all components of the third example in example-list
;;    - show-examples cannot be longer than example-list  
;;    - if show-examples is shorter than example-list, remaining elts in example-list get configuration #f
;; if num-examples is larger than length of example-list, additional blank exercises are added after the
;;   contents of example-list
;; buggy-funname-defn and buggy-examples-list enable creating design-recipe worksheets with
;;   errors in them (for use as assessments).  By default, the funname argument is copied into the 
;;   header and into each example.  These params override that behavior.  At most one of the 
;;   example-list and the buggy-example-list should be provided.
(define (design-recipe-exercise funname directions
                                #:page-header (page-header (string-append (translate 'design-title2) ":"))
                                #:show-funname-contract? (show-funname-contract? #f)
                                #:domain-list (domain-list '()) ; list of string
                                #:show-domains? (show-domains? #f) 
                                #:range (range #f)
                                #:show-range? (show-range? #f)
                                #:purpose (purpose #f)
                                #:show-purpose? (show-purpose? #f)
                                #:num-examples (num-examples 1) ; number of total example spaces to generate
                                #:example-list (example-list '()) ;concrete examples -- see doc above func for details
                                #:buggy-example-list (buggy-example-list '()) ; full concrete examples with error
                                #:show-examples (show-examples '()) ; see doc above func for details
                                #:buggy-funname-defn (buggy-funname-defn #f)
                                #:show-funname-defn? (show-funname-defn? #f)
                                #:param-list (param-list '()) ; list of string
                                #:show-params? (show-params? #f) 
                                #:body (body #f) ; a string
                                #:show-body? (show-body? #f)
                                #:grid-lines? (grid-lines? #f)
                                #:lang (lang 'racket)
                                )
  (when (and (cons? example-list) (cons? buggy-example-list))
    (error 'design-recipe-exercise "At most one of example-list and buggy-example-list should be provided"))
  (define contract-starter
    (cond
      [(equal? lang 'racket) ";"]
      [(equal? lang 'pyret) ""]))
  (define contract-colon
    (cond
      [(equal? lang 'racket) (para #:style (bootstrap-span-style "") ":")]
      [(equal? lang 'pyret) (make-spacer "::")]))
  (define contract-arrow
    (cond
      [(equal? lang 'racket) (para #:style (bootstrap-span-style "") htmlRarr)]
      [(equal? lang 'pyret) (make-spacer "->")]))
  (define arg-divider
    (cond
      [(equal? lang 'racket) " "]
      [(equal? lang 'pyret) ", "]))
  (define purpose-starter
    (cond
      [(equal? lang 'racket) ";"]
      [(equal? lang 'pyret) "#"]))
  (define argument-divider
     (if (equal? lang 'racket) (make-spacer " ") (make-spacer ", ")))
  (define example-builder
     (if (equal? lang 'racket) dr-example pyret-dr-example))
  (define definition-starter
     (if (equal? lang 'racket) "(define " "fun "))
  (define before-fun-name
     (if (equal? lang 'racket) (make-spacer "(") ""))
  (define before-params
     (if (equal? lang 'racket) "" (make-spacer "(")))
  (define param-joiner
     (if (equal? lang 'racket) " " ", "))
  (define header-ender
     (if (equal? lang 'racket) ")" "):"))
  (define body-ender
     (if (equal? lang 'racket) (make-spacer ")") (list (make-clear) (make-spacer "end"))))
  ; INSERT check that show-examples is no longer than example-list
  ; ALSO handle num-examples less than length of example-list
  (nested #:style (bootstrap-div-style/extra-id "segment" "exercises")
          (interleave-parbreaks/all
           (list
            (para #:style (bootstrap-div-style "exercise-header")
                  (bold page-header) (string-append " " funname))
            (if (string? directions)
                (para #:style (bootstrap-div-style "exercise-instr")
                      (bold (string-append (translate 'directions) ": ")) directions)
                (nested #:style (bootstrap-div-style "exercise-instr")
                        (interleave-parbreaks/all
                         (cons
                          (elem (bold (string-append (translate 'directions) ": ")) (first directions))
                          (rest directions)))))
            (nested #:style (bootstrap-div-style "designRecipeLayout")
                    (interleave-parbreaks/all
                     (list
                      (design-recipe-section
                       "recipe_contract" 
                       (translate 'design-section-contract)
                       (string-append (translate 'design-subheader-contract) "...")
                       (make-spacer contract-starter)
                       (make-wrapper
                        (dr-student-answer #:id? #f "recipe_name" #:show? show-funname-contract? funname)
                        contract-colon
                        (dr-student-answer "recipe_domain" #:show? show-domains? (string-join domain-list arg-divider))
                        contract-arrow
                        (dr-student-answer "recipe_range" #:show? show-range? range))
                       (make-clear)
                       (make-spacer purpose-starter)
                       (make-wrapper
                        (dr-student-answer "recipe_purpose" #:show? show-purpose? (string-append " " purpose))))
                      ;; need one of these for each example provided/expected
                      (design-recipe-section 
                        "recipe_examples"
                        (translate 'design-section-examples)
                        (string-append (translate 'design-subheader-examples) "...")
                        (let ([examples-part
                          (let ([example-elts
                               (cond
                                [(cons? buggy-example-list)
                                  (map (lambda (e)
                                        (example-builder (first e) (rest e)
                                                    #:show-funname? #t
                                                    #:show-input? #t
                                                    #:show-output? #t))
                                      buggy-example-list)]
                                [else
                                 ;; otherwise generate good examples
                                 (let ([num-blank-examples (- num-examples (length example-list))])
                                   (append 
                                    ; generate contents of example-list according to show-examples
                                    (map (lambda (e s) 
                                           ; e is either empty or a two-element list of input and output
                                           ; s is either a boolean or a three-element list of booleans
                                           ;   indicating whether to show the funname/input/output
                                           (example-builder funname e
                                                       #:show-funname? (show-example-component? s 'funname)
                                                       #:show-input? (show-example-component? s 'input)
                                                       #:show-output? (show-example-component? s 'output))) 
                                         example-list
                                         ; pad show-examples to match length of example-list
                                         ; padding value of #f means default is to not show example
                                         (append show-examples
                                                 (build-list (- (length example-list) (length show-examples))
                                                             (lambda (i) #f))))
                                    ; pad example list with empty examples to get to specified num-examples
                                    (build-list num-blank-examples (lambda (i) (example-builder funname '()))))
                                   )])])
                          ; insert clear-breaks between examples and merge the example content lists
                          (foldr (lambda (e res-rest) (append (cons (make-clear) e) res-rest))
                                 '() example-elts))])
                          (cond
                            [(equal? lang 'pyret)
                             (list
                              (make-spacer "examples:  ")
                              examples-part
                              (linebreak)
                              (make-spacer "end"))]
                            [else examples-part])
                        ))
                      (design-recipe-section 
                       "recipe_definition"
                       (translate 'design-section-def)
                       (string-append (translate 'design-subheader-def) "...")
                       (make-spacer definition-starter);; left literal because it represents a keyword/command, and should not be translated
                       before-fun-name
                       (make-wrapper
                        (dr-student-answer #:id? #f "recipe_name" #:show? show-funname-defn? (or buggy-funname-defn funname))
                        before-params
                        (dr-student-answer "recipe_variables" #:show? show-params? (string-join param-list param-joiner))
                        (make-spacer header-ender)
                        (make-clear)  
                        (dr-body body #:show show-body? #:lang lang)
                        (cond
                          ;; CSS generates closing ) for cond, so only gen in other cases
                          [(and (equal? lang 'racket) (not (cond-body? body))) body-ender]
                          [else ""])
                        )
                       (cond
                        [(equal? lang 'pyret) body-ender]
                        [else ""]) ;; TODO(joe): check for trailing ")" in pyret code/CSS
                      ))
                      ))))))

(define (cond-body? e) (and (list? e) (eq? (first e) 'cond)))

(define (atom? v) (not (list? v)))

; format the body of a design recipe worksheet -- formatting may depend on body contents
(define (dr-body body #:show (show #f) #:lang (lang 'racket))
  (define clause-starter
    (if (equal? lang 'racket) "[" "else if"))
  (define clause-splitter
    (if (equal? lang 'racket) "" (make-spacer ":")))
  (define clause-class
    (if (equal? lang 'racket) "clause" "clause hide-content"))
  (define (build-from-clauselines-pyret clauselines)
     (interleave-parbreaks/all
      (list 
          (apply make-wrapper
            (append 
                    (apply append clauselines)
                    (list (make-spacer "  end"))
                    )
            #:extra-class "cond hide-content"))))
  (define (build-from-clauselines-racket clauselines)
    (interleave-parbreaks/all
        (list (make-spacer "(")
              (apply make-wrapper
              (append (list (dr-student-answer "cond" #:show? show (first body)))
                      (apply append clauselines))
              #:extra-class "cond"))))
  (define build-from-clauselines
    (if (equal? lang 'racket) build-from-clauselines-racket build-from-clauselines-pyret))
  (if body
      (let ([body-contents body]) ;(if (string? body) (with-input-from-string body read) body)])
        (cond [(atom? body-contents)
               (dr-student-answer "recipe_definition_body" #:show? show body)]
              [(or (or (eq? (first body-contents) 'cond) (eq? (first body-contents) 'ask)) (and (eq? (first body-contents) 'if) (eq? lang 'pyret)))
               (let ([clauselines (map (lambda (c s) 
                                         (list 
                                          (make-clear)
                                          (cond 
                                            [(equal? lang 'racket) (make-spacer clause-starter)])
                                          (if (or (equal? (first c) 'otherwise) (equal? (first c) 'else))
                                            (make-wrapper #:extra-class clause-class
                                                          (if (and (equal? (first c) 'otherwise) (equal? lang 'racket)) (make-spacer " otherwise:") (make-spacer " else:"))
                                                            (dr-student-answer "answers" (second c) 
                                                                              #:id? #f #:show? (if (list? s) (second s) s)
                                                                              #:fmt-quotes? (equal? lang 'racket))
                                                            )  
                                            (make-wrapper #:extra-class clause-class
                                                          (cond ;; skip clause-starter for first and last if pyret
                                                            [(and (equal? lang 'pyret) (equal? c (second body-contents))) (make-spacer "if")]
                                                            [(and (equal? lang 'pyret) (nor (equal? c (second body-contents)) (equal? c (last body-contents)))) (make-spacer clause-starter)] )
                                                          
                                                          (dr-student-answer "questions" (first c) 
                                                                             #:id? #f #:show? (if (list? s) (first s) s)
                                                                             #:fmt-quotes? (equal? lang 'racket)
                                                                             #:add-space? (equal? lang 'pyret))
                                                          clause-splitter
                                                          (dr-student-answer "answers" (second c) 
                                                                             #:id? #f #:show? (if (list? s) (second s) s)
                                                                             #:fmt-quotes? (equal? lang 'racket))
                                                          ))))
                                       (rest body-contents)
                                       ; show is either a single boolean or a list of specs with same length as number of clauses
                                       (if (list? show) (rest show)
                                           (build-list (length (rest body-contents)) (lambda (i) show)))
                                       )])
                 (build-from-clauselines clauselines))]
              [else ;; assume single-line expression for now
               (dr-student-answer "recipe_definition_body" #:show? show body #:fmt-quotes? #t)]))
      ;; eventually, this should become a warning about the body missing
      (dr-student-answer "recipe_definition_body" #:show? show body)))

(define (design-recipe-section id title instructions . body)
  (nested #:style (bootstrap-div-style/id/nested id)
          (interleave-parbreaks/all
           (append (list (para #:style (bootstrap-div-style "sectionTitle") title)
                         (para #:style (bootstrap-div-style "sectionInstructions") instructions))
                   (interleave-parbreaks/all body)))))     

(define (make-wrapper #:extra-class (extra-class "") . contents)
  (nested #:style (bootstrap-div-style (string-append "wrapper" " " extra-class))
          (interleave-parbreaks/all contents))) 

(define (make-indent)
  (para #:style (bootstrap-span-style "indent") "  "))

(define (make-spacer contents)
  (let* ([keywords-pyret (list "fun" "if" "else:" "else if" "end" "examples:")]
         [contents (if (member (string-normalize-spaces contents) keywords-pyret string=?) (bold contents) contents)])
    (para #:style (bootstrap-span-style "spacer") contents)))

(define (make-spacer/elem contents)
  (elem #:style (bootstrap-span-style "spacer") contents))


(define (make-clear)
  (para #:style (bootstrap-span-style "clear") ""))
  
;; return sublist of L containing all but the last argument
(define (all-but-last L) (reverse (rest (reverse L))))

;; format values for display in exercises.  Handles escapes for things like dollar amounts
(define (format-exercise-text e #:fmt-quotes? (fmt-quotes? #t))
  (cond [(number? e) (format "~a" e)]
        [(string? e) (cond [(money-escaped? e) (format "~a" (~r (rem-money-escape e) #:precision '(= 2)))]
                           [fmt-quotes? (format "~s" e)]
                           [else (format "~a" e)])]
        [(list? e) (string-append "(" 
                                  (string-join (map (lambda (c) (format-exercise-text c #:fmt-quotes? fmt-quotes?)) e))
                                  ;(apply string-append (map (lambda (c) (format-exercise-text c #:fmt-quotes? fmt-quotes?)) e))
                                  ")")]
        [else (format "~a" e)]))

;; format a list as a string with spaces between each element
(define (list->spaced-string L)
  (string-join (map format-exercise-text L)))
  ;(apply string-append (map (lambda (e) (format-exercise-text e)) L)))
(define (list->comma-string L)
  (string-join (map format-exercise-text L) ", "))

;; generate an example within a design recipe activity
;; in-out-list is either empty or a list with the input and output expressions
;;   these expressions can be any type, but will be formatted to strings
;; the optional show arguments control which parts of the example are displayed
(define (dr-example funname in-out-list
                    #:show-funname? (show-funname? #f) 
                    #:show-input? (show-input? #f)
                    #:show-output? (show-output? #f)
                    )
  (let ([input (if (empty? in-out-list) "" (list->spaced-string (all-but-last in-out-list)))]
        [output (if (empty? in-out-list) "" (format-exercise-text (last in-out-list)))])
    (interleave-parbreaks/all
     (list (make-spacer (string-append "(" ( translate 'design-example-caps ) " "))
           (make-spacer "(")
           (make-wrapper
            (dr-student-answer #:id? #f "recipe_name" #:show? show-funname? funname)
            (dr-student-answer #:id? #f "recipe_example_inputs" #:show? show-input? input)
            (make-spacer ")")
            ;(make-clear) ; only force this for long-form DR (maybe via a flag?)
            (dr-student-answer #:id? #f "recipe_example_body"#:show? show-output? output)
            ;(make-spacer ")")
            ))))) 


(define (pyret-dr-example funname in-out-list
                    #:show-funname? (show-funname? #f) 
                    #:show-input? (show-input? #f)
                    #:show-output? (show-output? #f)
                    )
  (let ([input (if (empty? in-out-list) "" (list->comma-string (all-but-last in-out-list)))]
        [output (if (empty? in-out-list) "" (format-exercise-text (last in-out-list) #:fmt-quotes? #f))])
    (interleave-parbreaks/all
     (list (make-wrapper #:extra-class "hide-content"
            (make-indent)
            (dr-student-answer #:id? #f "recipe_name" #:show? show-funname? funname)
            (make-spacer "(")
            (dr-student-answer #:id? #f "recipe_example_inputs" #:show? show-input? input)
            (make-spacer ") is ")
            ;(make-clear) ; only force this for long-form DR (maybe via a flag?)
            (dr-student-answer #:id? #f "recipe_example_body"#:show? show-output? output))
              ;(make-spacer ")")
            ))))

;; extra-answer allows us to put the closing paren spacer into the answer field
(define (dr-student-answer class-or-id answer 
                           #:id? (id? #t) 
                           #:extra-class (extra-class "")
                           #:extra-answer (extra-answer #f)
                           #:show? (show? #f) 
                           #:fmt-quotes? (fmt-quotes? #f)
                           #:add-space? (add-space? #f))
  (let* ([show? (or show? (solutions-mode?))]
         [answer (if add-space? (string-append "   " answer) answer)] ;; add space for pyret
         [base-style (string-append (if show? 
                                        "studentAnswer solution" 
                                        "studentAnswer blank") 
                                    " " 
                                    extra-class)]
         [style (if id? 
                    (bootstrap-span-style/extra-id base-style class-or-id) 
                    (bootstrap-span-style (string-append base-style " " class-or-id)))]
         [raw-ans (cond [show? (format-exercise-text answer #:fmt-quotes? fmt-quotes?)]
                        [(string? answer) (make-string (string-length answer) #\M)]
                        [else (make-string (string-length (format "~a" answer)) #\M)])])
    (para #:style style (if extra-answer (list raw-ans extra-answer) raw-ans))))
