#lang racket/base

(require "sxml.rkt"
         (prefix-in wescheme: "wescheme.rkt")
         racket/runtime-path
         racket/stxparam
         scribble/base
         scribble/core
         scribble/decode
         [except-in scribble/manual code]
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
	 worksheet-table
         contract-exercise
         
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
         agenda

         ;; Misc
         standards
         unit-length



         ;; Include lesson
         include-lesson
         
         
         ;; stuff added by the interns
         ;;edited contract-exercise
         overview
         copyright
         example
         function-header
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
;; hints and answers may contain arbitrary formatting, not just strings
(define (think-about #:question question 
                     #:hint (hint #f)
                     #:answer (answer #f))
  (sxml->element (string-append
                     question
                     (if hint (format " (Hint: ~a)" hint) "")
                     (if answer (format " (Answer: ~a)" answer) "")
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

;(define (contract-exercise tag #:func-name (func-name #f))
;  (para ";"
;        (if func-name
;            func-name
;            (fill-in-the-blank #:id (format "~aname" tag) #:label (format "~aname" tag)))
;      " : "
;        (fill-in-the-blank #:id (format "~aarg" tag) #:label (format "~aarg" tag))
;        " -> "
;        (fill-in-the-blank #:id (format "~aoutput" tag) #:label (format "~aoutput" tag))))        


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
                #:subsumes (subsumes #f)
                #:prerequisites (prerequisites #f)
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
		      (map format-cell r))
		    rows))))

(define (format-cell s)
  (if (string? s)
      (para s)
      s))
  
;; worksheet-table : list[string] list[element] list[string] -> table
;; assert: col-headers should be same length as (add1 id-tags)
(define (worksheet-table col-headers left-col id-tags)
  (table (style #f 
		(list 
		 (table-columns
                  (build-list (add1 (length id-tags))
                              (lambda (n) (style #f '(left)))))))
	 (cons (map (lambda (h) (para (bold h))) col-headers)
               (map (lambda (left-content row-num) 
                      (cons (format-cell left-content)
                            (map (lambda (tag) 
                                   (para (fill-in-the-blank 
                                          #:id (format "~a~a" tag row-num)
                                          #:label (format "~a~a" tag row-num))))
                                 id-tags)))
                    left-col (build-list (length left-col) add1)))))
               
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

(define (agenda . items)
  (list "Agenda:"
        (apply itemlist items #:style "BootstrapAgendaList")))






(define (extract-lesson p)
  (unless (part? p)
    (error 'include-lesson "doc binding is not a part: ~e" p))
  (part-blocks p))

;; This acts somewhat like include-section, but avoids introducing the
;; additional part into the document structure.
(define-syntax (include-lesson stx)
  (syntax-case stx ()
    [(_ mp)
     (syntax/loc stx
       (begin
         (require (only-in mp [doc abstract-doc]))
         (extract-lesson abstract-doc)))]))



;;interns

(define (overview . body)
  (list (format "Unit Overview")
  (compound-paragraph (bootstrap-sectioning-style "BootstrapOverview")
                      (decode-flow body))))

;if it is a conditional example, cond? is true, otherwise false
(define (example cond? tag)
  (para "(EXAMPLE (" (fill-in-the-blank 
                        #:id (format "~a~a" tag ".0")
                        #:label "Use the function here") ") "
        (fill-in-the-blank
         #:id (format "~a~a" tag ".1")
         #:label (if cond? "What should the function produce?" "Find another way to get the same result here"))")"))
(define (contract-exercise tag)
  (para ";" (fill-in-the-blank #:id (format "~aname" tag) #:label "Name")
        ":" (fill-in-the-blank #:id (format "~aarg" tag) #:label "Domain")
        "->" (fill-in-the-blank #:id (format "~aoutput" tag) #:label "Range")))
(define (copyright . body)
  (para "Bootstrap by " (hyperlink "http://www.bootstrapworld.org/" "Emmanuel Schanzer") " is licensed under a "
        (hyperlink "http://creativecommons.org/licenses/by-nc-nd/3.0/" "Creative Commons 3.0 Unported License")
        ". Based on a work at " (hyperlink "http://www.bootstrapworld.org/" "www.BootsrapWorld.org")
        ". Permissions beyond the scope of this license may be available at "
        (hyperlink "mailto:schanzer@BootstrapWorld.org" "schanzer@BootstrapWorld.org") "."))
        

(define (function-header cond? tag)
  (if cond?         
                        (para "(define (" (fill-in-the-blank 
                        #:id (format "~a~a" tag ".0")
                        #:label "function name") 
                       (fill-in-the-blank 
                        #:id (format "~a~a" tag ".1")
                        #:label "variable names")"\n\t" 
                        (fill-in-the-blank 
                        #:id (format "~a~a" tag ".2")
                        #:label "") 
                        (fill-in-the-blank 
                        #:id (format "~a~a" tag ".3")
                        #:label "")
                        "\n\t" (fill-in-the-blank 
                        #:id (format "~a~a" tag ".4")
                        #:label "") 
                        (fill-in-the-blank 
                        #:id (format "~a~a" tag ".5")
                        #:label "")
                        "\n\t" (fill-in-the-blank 
                        #:id (format "~a~a" tag ".6")
                        #:label "") 
                        (fill-in-the-blank 
                        #:id (format "~a~a" tag ".7")
                        #:label "")
                        "\n\t" (fill-in-the-blank 
                        #:id (format "~a~a" tag ".8")
                        #:label "") 
                        (fill-in-the-blank 
                        #:id (format "~a~a" tag ".9")
                        #:label "")
                        "\n\t" (fill-in-the-blank 
                        #:id (format "~a~a" tag ".10")
                        #:label "") 
                        (fill-in-the-blank 
                        #:id (format "~a~a" tag ".11")
                        #:label "")
                        "\n\t" (fill-in-the-blank 
                        #:id (format "~a~a" tag ".12")
                        #:label "") 
                        (fill-in-the-blank 
                        #:id (format "~a~a" tag ".13")
                        #:label ""))
                        
                        (para "(define (" (fill-in-the-blank 
                        #:id (format "~a~a" tag ".0")
                        #:label "function name") 
                       (fill-in-the-blank 
                        #:id (format "~a~a" tag ".1")
                        #:label "variable names")"\n\t"(fill-in-the-blank 
                        #:id (format "~a~a" tag ".14")
                        #:label ""))))
                                    
                        