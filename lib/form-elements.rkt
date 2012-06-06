#lang racket/base

(require "sxml.rkt"
         (prefix-in wescheme: "wescheme.rkt")
         racket/runtime-path
         racket/stxparam
         scribble/base
         scribble/core
         scribble/decode
         scribble/manual
         scribble/html-properties
         (for-syntax racket/base))


;; FIXME: must add contracts!
(provide row
         current-row
         
         fill-in-the-blank
         free-response
         embedded-wescheme
         think-about
         code
         language-table
	 ;worksheet-table
         
         ;; Sections
         worksheet
         lesson
         drill
         exercise
	 skit
	 demo
	 review

         ;; Itemizations
         materials
         goals
	 do-now
         objectives
         product-outcomes
         preparation

         ;; Misc
         standards
         unit-length
)        





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This provides form loops and indices


(define current-row (make-parameter #f))


(define-syntax (row stx)
  (syntax-case stx ()
    [(row #:count n body ...)
     ;; FIXME: set up the parameterizations so we can repeat the content
     #'(build-list n (lambda (i)
                       (parameterize ([current-row i])
                         (paragraph (make-style "BootstrapRow" (list (make-alt-tag "div")))
                                    (list body ...)))))]))


;; When creating the ids for the form elements, if we're in the context of a row,
;; add it to the identifier as a ";~a" suffix.
(define (resolve-id id)
  (cond
   [(current-row)
    (format "~a;~a" id (current-row))]
   [else
    id]))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; One-line input
(define (fill-in-the-blank #:id id
                           #:columns (width 50)
                           #:label (label #f))
  (sxml->element `(input (@ (type "text")
                            (id ,(resolve-id id))
                            (width ,(number->string width))
                            ,@(if label
                                  `((placeholder ,label))
                                  '()))
                         "")))



;; Free form text
(define (free-response #:id id
                       #:columns (width 50)
                       #:rows (height 20)
                       #:label (label #f))
  (sxml->element `(textarea (@ (id ,(resolve-id id))
                               (cols ,(number->string width))
                               (rows ,(number->string height))
                               ,@(if label
                                     `((placeholder ,label))
                                     '()))
                            "")))



;; Embedded wescheme instances
(define (embedded-wescheme #:id id
                           #:public-id (pid #f)
                           #:width (width "90%")
                           #:height (height 500)
                           #:interactions-text (interactions-text #f)
                           #:hide-header? (hide-header? #f)
                           #:hide-footer? (hide-footer? #t)
                           #:hide-definitions? (hide-definitions? #f))
  (wescheme:embedded-wescheme #:id (resolve-id id)
                              #:public-id pid
                              #:width width
                              #:height height
                              #:interactions-text interactions-text
                              #:hide-header? hide-header?
                              #:hide-footer? hide-footer?
                              #:hide-definitions? hide-definitions?))




;; Lightweight questions with optional hints and answers
;; ideally hints/answers come up on some action, not by default
(define (think-about #:question question 
                     #:hint (hint #f)
                     #:answer (answer #f))
  (sxml->element (string-append
                     question
                     (if hint (string-append " (Hint: " hint ")") "")
                     (if answer (string-append " (Answer: " answer ")") "")
                   )))

(define (format-racket-header str)
  (format "; ~a~n" str))

(define (code #:contract (contract #f)
              #:purpose (purpose #f)
              . body)
  (apply verbatim #:indent 2 
         (append (if contract (list (format-racket-header contract)) '())
                 (if purpose (list (format-racket-header purpose)) '())
                  body)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(define-runtime-path bootstrap.css "bootstrap.css")
(define (bootstrap-sectioning-style name)
  (make-style name (list (make-css-addition bootstrap.css)
                         ;; Use <div/> rather than <p/>
                         (make-alt-tag "div"))))


;; The following provides sectioning for bootstrap.  
(define (worksheet . body)
  (compound-paragraph (bootstrap-sectioning-style "BootstrapWorksheet")
                      (decode-flow body)))


(define (lesson #:title (title #f)
                #:duration (duration #f)
                . body)
  (list (cond [(and title duration)
               (format "Lesson: ~a (Time ~a)~n" title duration)]
              [title (format "Lesson: ~a ~n" title)]
              [duration (format "Lesson (Time ~a)~n" duration)])
        (compound-paragraph (bootstrap-sectioning-style "BootstrapLesson")
                            (decode-flow body))))


(define (drill . body)
  (compound-paragraph (bootstrap-sectioning-style "BootstrapDrill")
                      (decode-flow body)))


(define (exercise . body) 
  (list "Exercise:"
        (compound-paragraph (bootstrap-sectioning-style "BootstrapExercise")
                            (decode-flow body))))


;; this needs some sort of ALT tag
(define (skit . body) 
  (list "Skit:"	
        (compound-paragraph (bootstrap-sectioning-style "BootstrapSkit")
                            (decode-flow body))))


(define (demo . body) 
  (list "Demo:"
        (compound-paragraph (bootstrap-sectioning-style "BootstrapDemo")
                            (decode-flow body))))


(define (review . body)
  (list "Review:"
        (compound-paragraph (bootstrap-sectioning-style "BootstrapReview")
                            (decode-flow body))))

(define (language-table . rows)
  (table (style #f 
		(list 
		 (table-columns
		  (list 
		   (style #f '(center))
		   (style #f '(center))))))
	 (cons (list (para (bold "Types")) (para (bold "Functions")))
	       (map (lambda (r)
		      (map (lambda (s)
			     (if (string? s)
				 (para s)
			         s))
			   r))
		    rows))))

#|
(define (worksheet-table col-headers . rows)
  (table (style #f 
		(list 
		 (table-columns
		  (list 
		   (style #f '(center))
		   (style #f '(center))))))
	 (cons (map (lambda (h) (para (bold h))) col-headers)
	       (map (lambda (r rownum)
		      (map (lambda (s)
			     (cond [(string? s) (para s)]
				   [(symbol? s) 
				   (fill-in-the-blank 
				    [#:id (format "~a~a" s rownum)
				     #:label (format "~a~a" s rownum)])]
				   [else s]))
			   r))
		    rows (list 1 2 3 4 5 6))))))
|#

(define (standards . body)
  (list "State Standards:"
        (compound-paragraph (bootstrap-sectioning-style "BootstrapStandards")
                            (decode-flow body))))

(define (unit-length timestr)
  (list (format "Length: ~a~n" (decode-flow timestr))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (materials . items)
  (list "Materials and Equipment:"
        (apply itemlist items #:style "BootstrapMaterialsList")))

(define (goals . items)
  (list "Goals:"
        (apply itemlist items #:style "BootstrapGoalsList")))

(define (do-now . items)
  (list "Do Now:"
        (apply itemlist items #:style "BootstrapDoNowList")))

(define (objectives . items)
  (list "Learning Objectives:"
        (apply itemlist items #:style "BootstrapLearningObjectivesList")))

(define (product-outcomes . items)
  (list "Product Outcomes:"
        (apply itemlist items #:style "BootstrapProductOutcomesList")))

(define (preparation . items)
  (list "Preparation:"
        (apply itemlist items #:style "BootstrapPreparationList")))

