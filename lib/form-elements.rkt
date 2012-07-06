#lang racket/base

(require (prefix-in wescheme: "wescheme.rkt")
         racket/runtime-path
         racket/stxparam
         racket/contract
         scribble/base
         scribble/core
         scribble/decode
         [prefix-in manual: scribble/manual]
         scribble/html-properties
         scribble/latex-properties
         scriblib/render-cond
         racket/path
         (for-syntax racket/base)
         2htdp/image
         racket/list
         "checker.rkt"
         "javascript-support.rkt")



;; FIXME: must add contracts!
(provide row
         current-row
         fill-in-the-blank
         free-response
	 drop-down
         embedded-wescheme
         think-about
         code
         language-table
	 worksheet-table
         build-table/cols
         contract-exercise
         function-exercise
         
         ;; Sections
         worksheet
         worksheet-segment
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
         bootstrap-title

         [rename-out [worksheet-link/src-path worksheet-link]]
         )        


(provide/contract [itemlist/splicing
                   (->* () 
                        (#:style (or/c style? string? symbol? #f)) 
                        #:rest (listof (or/c item? splice?))
                        itemization?)]
                  
                  [check
                   (-> constraint? element?)]
                  )

;;;;;;;;;;;;;;;; Site Images ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define bootstrap.gif (bitmap "bootstrap.gif"))
(define creativeCommonsLogo (bitmap "creativeCommonsLogo.png"))

;;;;;;;;;;;;;;;; Runtime Paths ;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-runtime-path bootstrap.css "bootstrap.css")
(define-runtime-path bootstrap-pdf.tex "bootstrap-pdf.tex")
(define-runtime-path worksheet-lesson-root (build-path 'up "lessons"))

;;;;;;;;;;;;;;;; Defining Styles ;;;;;;;;;;;;;;;;;;;;;;;;;

;; bootstrap-sectioning-style : string -> style
;; defines a style for both latex and css with the given name
(define (bootstrap-sectioning-style name)
  (make-style name (list (make-css-addition bootstrap.css)
                         (make-tex-addition bootstrap-pdf.tex)
                         ;; Use <div/> rather than <p/>
                         (make-alt-tag "div"))))

;; make-bs-latex-style : string -> style
;; defines a style that will only be used in latex
(define (make-bs-latex-style name) 
  (make-style name (list (make-tex-addition bootstrap-pdf.tex))))

(define bs-lesson-style (make-bs-latex-style "BootstrapLesson"))
(define bs-example-exercise-style (make-bs-latex-style "BSExampleExercise"))
(define bs-function-example-exercise-style (make-bs-latex-style "BSFunctionExampleExercise"))
(define bs-contract-exercise-style (make-bs-latex-style "BSContractExercise"))
(define bs-function-exercise-style (make-bs-latex-style "BSFunctionExercise"))
(define bs-fill-in-blank-style (make-bs-latex-style "BSFillInBlank"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
  (cond [(current-row)
         (format "~a;~a" id (current-row))]
        [else id]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; One-line input
(define (fill-in-the-blank #:id id
                           #:columns (width 50)
                           #:label (label #f)
                           #:answer (answer #f))
  (cond-element [html (sxml->element `(input (@ (type "text")
                                                (id ,(resolve-id id))
                                                (width ,(number->string width))
                                                ,@(if label
                                                      `((placeholder ,label))
                                                      '()))
                                             ""))]
                [(or latex pdf)
                 (elem #:style bs-fill-in-blank-style 
                       (if label label " "))]))


;; Free form text
(define (free-response #:id id
                       #:answer (answer #f)
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


;; drop-down menus
(define (drop-down #:id id
                   #:options (options '()))
  (sxml->element `(select (@ (id ,(resolve-id id)))
			  ,@(map (lambda (o) `(option ,o)) options))))
			     
			     

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
  (elem  question
         (if hint
             (list " (Hint: " hint ")")
             "")
         (if answer 
             (list " (Answer: " answer ")") 
             "")))

(define (format-racket-header str)
  (format "; ~a~n" str))

(define (code #:multi-line (multi-line #f)
              #:contract (contract #f)
              #:purpose (purpose #f)
              . body)
  ;; first an error check to make sure we understand original API usage
  (when (and (not multi-line) (or (and contract purpose) 
                                  (and contract (not (null? body))) 
                                  (and purpose (not (null? body)))))
    (printf "WARNING: Use of code that supplied more than one of contract/purpose/body~n"))
  (cond [multi-line
         (manual:codeblock (string-append (if contract (string-append ";; " contract "\n") "")
                                          (if purpose (string-append ";; " purpose "\n") "")
                                          (apply string-append body)))]
        [contract (manual:code (string-append ";; " contract))]
        [purpose (manual:code (string-append ";; " purpose))]
        [(not (null? body)) (manual:code (apply string-append body))]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; The following provides sectioning for bootstrap.  
(define (worksheet . body)
  (apply nested #:style (bootstrap-sectioning-style "BootstrapWorksheet")
         body))

(struct lesson-struct (title duration) #:transparent)


(define (lesson #:title (title #f)
                #:duration (duration #f)
                #:subsumes (subsumes #f)
                #:prerequisites (prerequisites #f)
                #:video (video #f)
                . body)
  (traverse-block
   (lambda (get set!)
     (set! 'bootstrap-lessons (cons (lesson-struct title duration) (get 'bootstrap-lessons '())))     
     
     (nested-flow
      (style "BootstrapLesson" '())
      (decode-flow
       (list (cond [(and title duration)
                    (compound-paragraph
                     (bootstrap-sectioning-style "BootstrapLessonTitle")
                     (decode-flow
                      (list
                       (format "Lesson: ~a (Time ~a)~n" title duration))))]
                   [title (compound-paragraph
                     (bootstrap-sectioning-style "BootstrapLessonTitle")
                     (decode-flow
                      (list
                       (format "~a ~n" title))))]
                   [duration (format "Lesson (Time ~a)~n" duration)])
             (compound-paragraph (bootstrap-sectioning-style "BootstrapLesson")
                                 (decode-flow body))))))))


(define (drill . body)
  (compound-paragraph (bootstrap-sectioning-style "BootstrapDrill")
                      (decode-flow body)))

(define (exercise . body) 
  (list (compound-paragraph (bootstrap-sectioning-style 
                             "BootstrapHeader")
                            (decode-flow (list "Exercise:")))
        (compound-paragraph (bootstrap-sectioning-style "BootstrapExercise")
                            (decode-flow body))))


;; this needs some sort of ALT tag
(define (skit . body) 
  (list "Skit:"	
        (compound-paragraph (bootstrap-sectioning-style "BootstrapSkit")
                            (decode-flow body))))


(define (demo . body) 
  (compound-paragraph (bootstrap-sectioning-style "BootstrapDemo")
                      (decode-flow (cons "Demo: " body))))


(define (review . body)
  (list "Review:"
        (compound-paragraph (bootstrap-sectioning-style "BootstrapReview")
                            (decode-flow body))))

;; language-table : list[list[elements]] -> table
;; produces table with the particular formatting for the Bootstrap language table
(define (language-table . rows)
  (table (style  #f 
		(list 
		 (table-columns
		  (list 
		   (style "BootstrapTable" '(center))
		   (style "BootstrapTable" '(center))))))   
         (cons (list (para #:style "BootstrapTableHeader" "Types")
                     (para #:style "BootstrapTableHeader" "Functions"))
               (map (lambda (r) (map para r)) rows))))

;; worksheet-table : list[string] list[element] list[string] number number -> table
;; assert: col-headers should be same length as (add1 id-tags)
(define (worksheet-table col-headers left-col id-tags width height)
  (build-table/cols col-headers 
                    (if (null? left-col) '() (list left-col))
                    (lambda (row-num col-num)
                      (para (fill-in-the-blank
                             #:id (format "~a~a" (list-ref id-tags col-num) row-num))))
                    width height))

;; build-table : list[string] list[list[element]] (number number -> element) 
;;               number number -> table
;; consumes column headers, contents for a prefix of the columns, a function to
;;          format each cell based on its row and col number, 
;;          and the number of columns and rows for the table
;;          (col-headers count as a row if they are provided)
;; produces a table (list of list of cell contents, row-major order)
;; ASSUMES: each list in col-contents has length height (which is the number of data rows)
(define (build-table/cols col-headers col-contents fmt-cell numCols numDataRows)
  ;; check assumption on col-contents lengths
  (for-each (lambda (col-content)
              (unless (= (length col-content) numDataRows)
                (error 'build-table/cols 
                       (format "column contents ~a needs to have one entry for each of ~a rows" 
                               col-content numDataRows))))
            col-contents)
  (let* ([blank-column (lambda (col-num)
                         (build-list numDataRows (lambda (row-num) 
                                                   (fmt-cell row-num col-num))))]
         [data-columns 
          (build-list numCols
                      (lambda (col-num) 
                        (cond [(>= col-num (length col-contents)) (blank-column col-num)]
                              [(null? (list-ref col-contents col-num)) (blank-column col-num)]
                              [else (map para (list-ref col-contents col-num))])))]
         [all-columns (if (null? col-headers) data-columns
                          (map cons 
                               (map (lambda (h) (para (bold h))) col-headers)
                               data-columns))])   
    (table (style "BSTable"
                  (list (table-columns
                         (build-list numCols
                                     (lambda (n) (style #f '(left)))))))
           ;; convert list of columns to list of rows
           (build-list (if (null? col-headers) numDataRows (add1 numDataRows))
                       (lambda (row-num) 
                         (map (lambda (col) (list-ref col row-num))
                              all-columns))))))

(define (standards . body)
  (list "State Standards:"
        (para (bootstrap-sectioning-style "BootstrapStandards")
              (decode-flow body))))

(define (unit-length timestr)
  (list (format "Length: ~a~n" (decode-flow timestr))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (materials . items)
  (list (compound-paragraph (bootstrap-sectioning-style "BootstrapHeader") 
                            (decode-flow (list "Materials and Equipment:")))
        (apply itemlist/splicing items #:style "BootstrapMaterialsList")))

(define (goals . items)
  (list "Goals:"
        (apply itemlist/splicing items #:style "BootstrapGoalsList")))

(define (do-now . items)
  (list "Do Now:"
        (apply itemlist/splicing items #:style "BootstrapDoNowList")))

(define (objectives . items)
  (list (compound-paragraph (bootstrap-sectioning-style "BootstrapHeader") 
                            (decode-flow (list "Learning Objectives:")))
        (apply itemlist/splicing items #:style "BootstrapLearningObjectivesList")))

(define (product-outcomes . items)
  (list (compound-paragraph (bootstrap-sectioning-style "BootstrapHeader") 
                            (decode-flow (list "Product Outcomes:")))
        (apply itemlist/splicing items #:style "BootstrapProductOutcomesList")))

(define (preparation . items)
  (list (compound-paragraph (bootstrap-sectioning-style "BootstrapHeader") 
                            (decode-flow (list "Preparation:")))
        (apply itemlist/splicing items #:style "BootstrapPreparationList")))



;; Cooperates with the Lesson tag.
(define (agenda . items)
  (traverse-block
   (lambda (get set)
     
     (lambda (get set)
       (define lessons (reverse (get 'bootstrap-lessons '())))
       
       (nested-flow
        (style "BootstrapAgenda" '(never-indents))
        (decode-flow
         (list "Agenda:"
               (apply itemlist/splicing
                      (map (lambda (a-lesson)
                             (item (list (lesson-struct-title a-lesson)
                                          " ("
                                          (lesson-struct-duration a-lesson)
                                          ")"
                                          )))
                           lessons)
                      #:style "BootstrapAgendaList"))))))))


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
  (list 
   ;(compound-paragraph (bootstrap-sectioning-style "BootstrapImage") ;(decode-flow (list bootstrap.gif)))
        (compound-paragraph (bootstrap-sectioning-style "BootstrapOverviewTitle") (decode-flow (list (format "Unit Overview"))))
        (agenda)
        (compound-paragraph (bootstrap-sectioning-style "BootstrapOverview")
                            (decode-flow body))
        ))


(define (contract-exercise tag #:name [name-ans #f] #:domain [domain-ans #f] #:range [range-ans #f])
  (cond-element [html
                 (elem ";" (fill-in-the-blank #:id (format "~aname" tag) #:label "Name")
                       ":" (fill-in-the-blank #:id (format "~aarg" tag) #:label "Domain")
                       "->" (fill-in-the-blank #:id (format "~aoutput" tag) #:label "Range"))]
                [(or latex pdf)
                 (elem #:style bs-contract-exercise-style "")]))

(define (worksheet-segment title)
  (compound-paragraph (bootstrap-sectioning-style "BootstrapWorksheetSegment")
                      (decode-flow (list title))))

;auto generates copyright section
(define (copyright . body)
  (compound-paragraph 
   (bootstrap-sectioning-style "BootstrapCopyright" ) 
   (decode-flow (list (hyperlink "http://creativecommons.org/licenses/by-nc-nd/3.0/" creativeCommonsLogo) "Bootstrap by " (hyperlink "http://www.bootstrapworld.org/" "Emmanuel Schanzer") " is licensed under a "
                      (hyperlink "http://creativecommons.org/licenses/by-nc-nd/3.0/" "Creative Commons 3.0 Unported License")
                      ". Based on a work at " (hyperlink "http://www.bootstrapworld.org/" "www.BootsrapWorld.org")
                      ". Permissions beyond the scope of this license may be available at "
                      (hyperlink "mailto:schanzer@BootstrapWorld.org" "schanzer@BootstrapWorld.org") "."))))

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

;; input: -a tag which can be anything unqiue which helps to generate a 
;;         unique id
;; output: in format (EXAMPLE (____ ____) _________)
(define (example-fast-functions tag)
  (cond-element 
   [html (elem "(EXAMPLE (" 
               (fill-in-the-blank #:id (format "~a.1" tag) #:label "")
               " "
               (fill-in-the-blank #:id (format "~a.2" tag) #:label "")
               ") "
               (fill-in-the-blank #:id (format "~a.3" tag) #:label "")
               ")")]
   [(or latex pdf) (elem #:style bs-function-example-exercise-style "")]))

;; input: -two optional text labels for the two fill-in-the-blanks 
;;        -a tag which can be anything unqiue which helps to generate a 
;;         unique id 
;; output: in format (EXAMPLE ( /*with text1label*/ _____) /*with text2label*/ _____)
(define (example-with-text #:text1 [text1 ""]
                           #:text2 [text2 ""]
                           tag
                           #:example1 [example1 #f]
                           #:example2 [example2 #f])
  (cond-element 
   [html (elem "(EXAMPLE (" 
               (fill-in-the-blank #:id (format "~a.1" tag) #:label text1)
               ") "
               (fill-in-the-blank #:id (format "~a.2" tag) #:label text2)
               ")")]
   [(or latex pdf) (elem #:style bs-example-exercise-style "")]))
                            
;; input: optional values for the name, args, and body fields of a function
;;        a tag to use for generating html id names
;; output: a define with text boxes formatted for inputs to the exercise
(define (function-exercise #:name [name ""]
                           #:args [args ""]
                           #:body [body ""]
                           tag)
  (cond-element 
   [html
    (elem "(define ("(fill-in-the-blank #:id (format "fname-~a" tag) #:label "function name")
          (fill-in-the-blank #:id (format "args-~a" tag) #:label "variable names") ")"
          (fill-in-the-blank #:id (format "body-~a" tag) #:label "what it does") ")")]
   [(or latex pef) (elem #:style bs-function-exercise-style "")]))

;; We need to do a little compile-time computation to get the file's source
;; where worksheet-link/src-path is used, since we want the path relative to
;; the usage, rather than to current-directory.
(define-syntax (worksheet-link/src-path stx)
  (syntax-case stx ()
    [(_ args ...)
     (with-syntax ([src-path (syntax-source stx)])
       (begin
         (syntax/loc stx
           (worksheet-link #:src-path src-path
                           args ...))))]))

(define (worksheet-link #:name name
                        #:page page
                        #:lesson [lesson #f]
                        #:src-path src-path)
  (define-values (base-path _ dir?) (split-path src-path))
  (define the-relative-path
    (if lesson
        (find-relative-path (simple-form-path (current-directory))
                            (simple-form-path (build-path worksheet-lesson-root
                                                          lesson
                                                          "worksheets"
                                                          (format "~a.html" name))))
        (find-relative-path (simple-form-path (current-directory))
                            (simple-form-path (build-path base-path
                                                          'up
                                                          "worksheets"
                                                          (format "~a.html" name))))))
  (list (hyperlink the-relative-path
                   "Page " (number->string page))))

;; generates the title, which includes the bootstrap logo in html but not in latex/pdf
(define (bootstrap-title . body)
  (define the-title (apply string-append body))
  (define unit+title (regexp-match #px"^([^:]+):\\s*(.+)$" the-title)) 
  (define bootstrap-image (cond-element 
                           [html bootstrap.gif]
                           [(or latex pdf) 
                            (elem)]))
  (cond
    [unit+title
     (list (compound-paragraph 
            (bootstrap-sectioning-style "BootstrapTitle") 
            (decode-flow (list bootstrap-image (second unit+title))))
           "\n"
           (compound-paragraph
            (bootstrap-sectioning-style "BootstrapTitle")
            (decode-flow (list (third unit+title)))))]
    [else
     (list (compound-paragraph
            (bootstrap-sectioning-style "BootstrapTitle")
            (decode-flow (cons bootstrap-image body))))]))

(define (check constraint #:id (id (gensym 'check)))
  (elem (sxml->element
         `(input
           (@ (id ,(format "~a" id))
              (type "button")
              (value "Check answer")
              (class "BootstrapCheckbox"))
           ""))
        (inject-javascript
         (format "jQuery(document.getElementById(~s)).click(function() {
                       if (~a) {
                            alert('Congrats! You got it right');
                       } else {
                            alert('Sorry! Try again.');
                       }
                   });"
                 (format "~a" id)
                 (constraint->js constraint)))))
