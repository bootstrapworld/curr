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
         example-with-text
         example-fast-functions
         state-standards
         length-of-lesson
         itemlist/splicing
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
                           #:definitions-text (definitions-text #f)
                           #:hide-header? (hide-header? #t)
                           #:hide-toolbar? (hide-toolbar? #f)
                           #:hide-project-name? (hide-project-name? #t)
                           #:hide-footer? (hide-footer? #t)
                           #:hide-definitions? (hide-definitions? #f)
                           #:hide-interactions? (hide-interactions? #f))
  (wescheme:embedded-wescheme #:id (resolve-id id)
                              #:public-id pid
                              #:width width
                              #:height height
                              #:interactions-text interactions-text
                              #:definitions-text definitions-text
                              #:hide-header? hide-header?
                              #:hide-toolbar? hide-toolbar?
                              #:hide-project-name? hide-project-name?
                              #:hide-footer? hide-footer?
                              #:hide-definitions? hide-definitions?
                              #:hide-interactions? hide-interactions?))




;; Lightweight questions with optional hints and answers
;; ideally hints/answers come up on some action, not by default
;; hints and answers may contain arbitrary formatting, not just strings
(define (think-about #:question (question #f) 
                     #:hint (hint #f)
                     #:answer (answer #f))
  (sxml->element (string-append
                     (format "~a" question)
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
               (compound-paragraph (bootstrap-sectioning-style "BootstrapLessonTitle") (decode-flow (list (format "Lesson: ~a (Time ~a)~n" title duration))))]
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
  (table (style  #f 
		(list 
		 (table-columns
		  (list 
		   (style "BootstrapTable" '(center))
		   (style "BootstrapTable" '(center))))))
         
         (cons (list (compound-paragraph (bootstrap-sectioning-style "BootstrapTableHeader")
                            (decode-flow (list "Types"))) (compound-paragraph (bootstrap-sectioning-style "BootstrapTableHeader")
                            (decode-flow (list "Functions"))))
	       (map (lambda (r)
		      (map format-cell r))
		    rows))))
;	 (cons (list (para (bold "Types")) (para (bold "Functions")))
;	       (map (lambda (r)
;		      (map format-cell r))
;		    rows))))

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
  (list (compound-paragraph (bootstrap-sectioning-style "BootstrapHeader") (decode-flow (list "Materials and Equipment:")))
        (apply itemlist/splicing items #:style "BootstrapMaterialsList")))

(define (goals . items)
  (list "Goals:"
        (apply itemlist/splicing items #:style "BootstrapGoalsList")))

(define (do-now . items)
  (list "Do Now:"
        (apply itemlist/splicing items #:style "BootstrapDoNowList")))

(define (objectives . items)
  (list (compound-paragraph (bootstrap-sectioning-style "BootstrapHeader") (decode-flow (list "Learning Objectives:")))
        (apply itemlist/splicing items #:style "BootstrapLearningObjectivesList")))

(define (product-outcomes . items)
  (list (compound-paragraph (bootstrap-sectioning-style "BootstrapHeader") (decode-flow (list "Product Outcomes:")))
        (apply itemlist/splicing items #:style "BootstrapProductOutcomesList")))

(define (preparation . items)
  (list (compound-paragraph (bootstrap-sectioning-style "BootstrapHeader") (decode-flow (list "Preparation:")))
        (apply itemlist/splicing items #:style "BootstrapPreparationList")))

(define (agenda . items)
  (list "Agenda:"
        (apply itemlist/splicing items #:style "BootstrapAgendaList")))


;; itemlist/splicing is like itemlist, but also cooperates with the
;; splice form to absorb arguments.  We use this in combination
;; with tags.
(define (itemlist/splicing #:style [style #f] . items)
  (define spliced-items
    (reverse
     (let loop ([items items]
                [acc '()])
       (foldl (lambda (i acc)
                (cond
                 [(splice? i)
                  (loop (splice-run i) acc)]
                 [else
                  (cons i acc)]))
              acc
              items))))
  (apply itemlist spliced-items #:style style))




(define (extract-lesson p)
  (unless (part? p)
    (error 'include-lesson "doc binding is not a part: ~e" p))
  (part-blocks p))

(define-syntax-rule (include-lesson mp)
  (begin
    (require (only-in mp [doc abstract-doc]))
    (extract-lesson abstract-doc)))



;;interns
;
(define (overview . body)
  (list (compound-paragraph (bootstrap-sectioning-style "BootstrapImage") (decode-flow (list (image "bootstrap.gif"))))
        (compound-paragraph (bootstrap-sectioning-style "BootstrapOverviewTitle") (decode-flow (list (format "Unit Overview"))))
        (compound-paragraph (bootstrap-sectioning-style "BootstrapOverview")
                            (decode-flow body))))


(define (contract-exercise tag)
  (para ";" (fill-in-the-blank #:id (format "~aname" tag) #:label "Name")
        ":" (fill-in-the-blank #:id (format "~aarg" tag) #:label "Domain")
        "->" (fill-in-the-blank #:id (format "~aoutput" tag) #:label "Range")))



;auto generates copyright section
(define (copyright . body)
  (para "Bootstrap by " (hyperlink "http://www.bootstrapworld.org/" "Emmanuel Schanzer") " is licensed under a "
        (hyperlink "http://creativecommons.org/licenses/by-nc-nd/3.0/" "Creative Commons 3.0 Unported License")
        ". Based on a work at " (hyperlink "http://www.bootstrapworld.org/" "www.BootsrapWorld.org")
        ". Permissions beyond the scope of this license may be available at "
        (hyperlink "mailto:schanzer@BootstrapWorld.org" "schanzer@BootstrapWorld.org") "."))

;autogenerates state-standards section
(define state-standards
  (list
   (compound-paragraph (bootstrap-sectioning-style "BootstrapHeader") (decode-flow (list "State Standards")))
   (para "See " (hyperlink "https://spreadsheets.google.com/a/brown.edu/pub?key=0Ak3Voejjnf0ldHlQcXRVWTZDbVprWHlBLTJWRlQ2dkE&hl=en&gid=0" "Bootstrap Standards Matrix") " provided as part of the Bootstrap curriculum.")))

;creates the length of the lesson based on input
;input ONLY THE NUMBER!
(define (length-of-lesson l)
  (list (compound-paragraph (bootstrap-sectioning-style "BootstrapHeader") (decode-flow (list (format "Length: ~a minutes" l))))))


;;example: optional text, example for cond (p23), example for not cond (p21), example for with name (p8)


;; input: -a tag which can be anything unqiue which helps to generate a ;;         unique id
;; output: in format (EXAMPLE (____ ____) _________)
(define (example-fast-functions tag)
  (para "(EXAMPLE (" 
        (fill-in-the-blank #:id (format "~a.1" tag) #:label "")
        " "
        (fill-in-the-blank #:id (format "~a.2" tag) #:label "")
        ") "
        (fill-in-the-blank #:id (format "~a.3" tag) #:label "")
        ")"))


;; input: -two optional text labels for the two fill-in-the-blanks 
;;        -a tag which can be anything unqiue which helps to generate a ;;         unique id 
;; output: in format (EXAMPLE ( /*with text1label*/ _____) /*with text2label*/ _____)
(define (example-with-text #:text1 [text1 ""]
                           #:text2 [text2 ""]
                           tag)
  (para "(EXAMPLE (" 
        (fill-in-the-blank #:id (format "~a.1" tag) #:label text1)
        ") "
        (fill-in-the-blank #:id (format "~a.2" tag) #:label text2)
        ")"))
                                    

;to-be-deleted
;if it is a conditional example, cond? is true, otherwise false
;(define (example cond? tag)
;  (para "(EXAMPLE (" (fill-in-the-blank 
;                        #:id (format "~a~a" tag ".0")
;                        #:label "Use the function here") ") "
;        (fill-in-the-blank
;         #:id (format "~a~a" tag ".1")
;         #:label (if cond? "What should the function produce?" "Find another way to get the same result here"))")"))