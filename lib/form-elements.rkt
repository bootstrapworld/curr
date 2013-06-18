#lang racket/base

(require (prefix-in wescheme: "wescheme.rkt")
         racket/runtime-path
         racket/stxparam
         racket/contract
         racket/string
         scribble/base
         scribble/core
         scribble/decode
         scribble/basic
         (prefix-in manual: scribble/manual)
         scribble/html-properties
         scribble/latex-properties
         scriblib/render-cond
         racket/path
         (for-syntax racket/base racket/syntax)
         2htdp/image
         racket/list
         net/uri-codec
         racket/match
         "compile-time-params.rkt"
         "system-parameters.rkt"
         "checker.rkt"
         "javascript-support.rkt"
         "paths.rkt")



;; FIXME: must add contracts!
(provide row
         current-row
         fill-in-the-blank
         free-response
         drop-down
         embedded-wescheme
         think-about
         vocab
         code
         language-table
         worksheet-table
         build-table/cols
         contract-exercise
         function-exercise
         design-recipe-exercise
         circles-evaluation-exercise
         unit-summary/links
         summary-item/links
         summary-item/custom
         
         ;; Sections
         worksheet
         worksheet-segment
         lesson
         drill
         exercise
         skit
         demo
         activity
         review
         unit-separator
         unit-descr
         main-contents
         
         ;; new format stuff
         lesson/studteach
         pacing
         points
         point
         exercises
         student
         teacher
         
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
         
         ;; Include lesson/lesson link
         include-lesson
         lesson-link
         
         ;; stuff added by the interns
         ;;edited contract-exercise
         overview
         copyright
         example-with-text
         example-fast-functions
         state-standards
         length-of-lesson
         bootstrap-title
         
         ;; stuff added by Vicki
         struct-example-with-text
         struct-design-recipe-exercise
         struct-function-exercise
         
         [rename-out [worksheet-link/src-path worksheet-link]]
         
         resource-link
         video-link
         )        



(provide/contract [itemlist/splicing
                   (->* () 
                        (#:style (or/c style? string? symbol? #f)) 
                        #:rest list?
                        itemization?)]
                  
                  [check
                   (-> constraint? element?)]
                  )






;; fake-item: (listof any) -> (listof any)
;; We try to make itemlist more pleasant to work with.  Itemlist/splicing automatically
;; wraps items around every argument, so there's no need to call item explicitly.
;; We provide a fake definition for fake-item that just returns the identity.
(define (fake-item . args)
  args)

(provide fake-item)



;;;;;;;;;;;;;;;; Site Images ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define bootstrap.gif (bitmap "bootstrap.gif"))
(define creativeCommonsLogo (bitmap "creativeCommonsLogo.png"))

;;;;;;;;;;;;;;;; Runtime Paths ;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-runtime-path bootstrap.css "bootstrap.css")
(define-runtime-path bootstrap-pdf.tex "bootstrap-pdf.tex")
(define-runtime-path worksheet-lesson-root (build-path 'up "lessons"))
(define-runtime-path textbook.css "textbook.css")
(define-runtime-path pretty-printing.css "pretty-printing.css")
(define-runtime-path codemirror.js "codemirror.js")
(define-runtime-path runmode.js "runmode.js")
(define-runtime-path scheme2.js "scheme2.js")
(define-runtime-path bootstraplesson.js "bootstraplesson.js")
(define-runtime-path logo.png "logo.png")

(define css-js-additions
  (list (make-css-addition bootstrap.css)
        (make-tex-addition bootstrap-pdf.tex)
        (make-css-addition textbook.css)
        (make-css-addition pretty-printing.css)
        (make-js-addition codemirror.js)
        (make-js-addition runmode.js)
        (make-js-addition scheme2.js)
        (make-js-addition bootstraplesson.js)
        ))

;;;;;;;;;;;;;;;; Defining Styles ;;;;;;;;;;;;;;;;;;;;;;;;;

;; bootstrap-sectioning-style : string -> style
;; defines a style for a section based on the <div> tag
(define (bootstrap-sectioning-style name)
  (make-style name (cons (make-alt-tag "div")
                         css-js-additions)))

(define (bootstrap-div-style name)
  (make-style name (cons (make-alt-tag "div")
                         css-js-additions)))

(define (bootstrap-span-style name)
  (make-style name (cons (make-alt-tag "span")
                         css-js-additions)))

;; bootstrap-style : string -> style
;; defines a style for both latex and css with the given name
(define (bootstrap-style name)
  (make-style name (cons (make-alt-tag "span")
                         css-js-additions)))

(define bs-header-style (bootstrap-style "BootstrapHeader"))
(define bs-title-style (bootstrap-style "BootstrapTitle"))
(define bs-lesson-title-style (bootstrap-style "BootstrapLessonTitle"))
(define bs-lesson-name-style (bootstrap-style "BSLessonName"))
(define bs-lesson-duration-style (bootstrap-style "BSLessonDuration"))
(define bs-video-style (bootstrap-style "BootstrapVideo"))
(define bs-page-title-style (bootstrap-style "BootstrapPageTitle"))

;; new lesson styles
(define bs-time-style (bootstrap-span-style "time"))
(define bs-callout-style (bootstrap-div-style "callout"))
(define bs-student-style (bootstrap-div-style "student"))
(define bs-teacher-style (bootstrap-div-style "teacher"))
(define bs-logo-style (bootstrap-span-style "BootstrapLogo"))
(define bs-vocab-style (bootstrap-span-style "vocab"))

;; make-bs-latex-style : string -> style
;; defines a style that will only be used in latex
(define (make-bs-latex-style name) 
  (make-style name (list (make-tex-addition bootstrap-pdf.tex))))

(define bs-lesson-style (make-bs-latex-style "BootstrapLesson"))
(define bs-example-exercise-style (make-bs-latex-style "BSExampleExercise"))
(define bs-function-example-exercise-style (make-bs-latex-style "BSFunctionExampleExercise"))
(define bs-contract-exercise-style (make-bs-latex-style "BSContractExercise"))
(define bs-contract-purpose-exercise-style (make-bs-latex-style "BSContractPurposeExercise"))
(define bs-function-exercise-style (make-bs-latex-style "BSFunctionExercise"))
(define bs-fill-in-blank-style (make-bs-latex-style "BSFillInBlank"))
(define bs-free-response-style (make-bs-latex-style "BSFreeResponse"))

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


;; Inputs: string number string string -> element
;; Generates a single-line input area
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

;; Inputs: string element number number string -> element
;; Generates a multi-line input area of size given in column/row arguments
(define (free-response #:id id
                       #:answer (answer #f)
                       #:columns (width 50)
                       #:rows (height 20)
                       #:label (label #f))
  (cond-element 
   [html (sxml->element `(textarea (@ (id ,(resolve-id id))
                                      (cols ,(number->string width))
                                      (rows ,(number->string height))
                                      ,@(if label
                                            `((placeholder ,label))
                                            '()))
                                   ""))]
   [(or latex pdf)
    (elem #:style bs-free-response-style (number->string width) (number->string height))]))


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
                           #:hide-interactions? (hide-interactions? #f)
                           #:auto-run? (auto-run? #f))
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
                              #:hide-interactions? hide-interactions?
                              #:auto-run? auto-run?))




;; Lightweight questions with optional hints and answers
;; ideally hints/answers come up on some action, not by default
;; hints and answers may contain arbitrary formatting, not just strings
(define (think-about #:question (question #f) 
                     #:hint (hint #f)
                     #:answer (answer #f))
  (list question
        (if hint
            (list " (Hint: " hint ")")
            "")
        (if answer 
            (list " (Answer: " answer ")") 
            "")))

(define (format-racket-header str)
  (format "; ~a~n" str))

(define (vocab body)
  (elem #:style bs-vocab-style body))

(define (code #:multi-line (multi-line #f)
              #:contract (contract #f)
              #:purpose (purpose #f)
              . body)
  ;; first an error check to make sure we understand original API usage
  (when (and (not multi-line) (or (and contract purpose) 
                                  (and contract (not (null? body))) 
                                  (and purpose (not (null? body)))))
    (printf "WARNING: Use of code that supplied more than one of contract/purpose/body~n"))
  (let ([allcode (string-append (if contract (string-append "; " contract "\n") "")
                                (if purpose (string-append "; " purpose "\n") "")
                                (apply string-append body) 
                                )])
    ;; we do not use the built-in Racket code formatting in order
    ;; to let codemirror can handle it instead
    (cond-element 
     [html (if multi-line 
               (sxml->element `(textarea ,(string-append "\n" allcode "\n")))
               (sxml->element `(tt ,allcode)))]               
     [else allcode])))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; The following provides sectioning for bootstrap.  
(define (worksheet . body)
  (nested #:style (bootstrap-sectioning-style "BootstrapWorksheet")
          body))



;; lesson-struct records the outline of a structure: basically, its
;; title, how long it takes, and the anchor to get to it within the
;; current document.
(struct lesson-struct (title     ;; (U string #f)
                       duration  ;; string e.g. "15 min"
                       anchor)   ;; string
  #:transparent)



;; lesson: #:title #:duration #:subsumes #:prerequisites #:video body ... -> block
;;
;; Creates a lesson block; this block is hyperlinked.  Internally,
;; it's a traverse-block.  In the traverse phase, we assign to
;; 'bootstrap-lessons so that other phases can pick out which lessons
;; have been defined.
;;
;; bootstrap-lessons is a (listof lesson-struct), whose structure should be
;; defined right above us.
(define (lesson #:title (title #f)
                #:duration (duration #f)
                #:subsumes (subsumes #f)
                #:prerequisites (prerequisites #f)
                #:video (video #f)
                . body)
  
  (define the-lesson-name 
    (or (current-lesson-name) 
        (symbol->string (gensym (string->symbol (or title 'lesson))))))
  
  (define video-elem (cond [(and video (list? video))
                            (map (lambda (v) (elem #:style bs-video-style v)) video)]
                           [video (elem #:style bs-video-style video)]
                           [else (elem)]))
  (traverse-block
   (lambda (get set!)
     (define anchor (lesson-name->anchor-name the-lesson-name))
     (set! 'bootstrap-lessons (cons (lesson-struct title
                                                   duration
                                                   anchor)
                                    (get 'bootstrap-lessons '())))     
     (nested-flow 
      (style "BootstrapLesson" '())
      (decode-flow
       (list
        (elem #:style (style #f (list (url-anchor anchor))))
        (cond [(and title duration)
               (para #:style bs-lesson-title-style
                     (list (elem #:style bs-lesson-name-style title) 
                           video-elem
                           (elem #:style bs-lesson-duration-style (format "(Time ~a)" duration))))]
              [title 
               (para #:style bs-lesson-title-style
                     (list (elem #:style bs-lesson-name-style title)
                           video-elem))]
              [duration 
               (para #:style bs-lesson-title-style
                     (list (elem #:style bs-lesson-name-style (format "Lesson "))
                           video-elem
                           (elem #:style bs-lesson-duration-style (format "(Time ~a)" duration))))])
        (nested #:style (bootstrap-sectioning-style "BootstrapLesson")
                body)))))))


;;;;;;;;;;;;; SSI COMMANDS ;;;;;;;;;;;;;;;;;;;;;;;


;<!-- #include virtual="../menubar.ssi" -->

(define (include-ssi)
  (cond-element 
   [html (elem "<!-- #include virtual=\"../menubar.ssi\" -->")]
   [(or latex pdf) (elem "")]))

;; this just here as a sample while I get includes and injections working
#;(define (check constraint #:id (id (gensym 'check)))
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



;;;;;;;;;;;;; NEW LESSON FORMAT ;;;;;;;;;;;;;;;;;;

(define (insert-toggle-buttons)
  (cond-element
   [html (sxml->element
          `(center
            (input (@ (type "button") (id "prev") (value "<<") (onclick "prevCard();")) "")
            (input (@ (type "button") (value "Toggle Notes") (onclick "showTeacherNotes();")) "")
            (input (@ (type "button") (id "next") (value ">>") (onclick "nextCard();")) "")
            ))]
   [else (elem "")]))

(define (student . content)
  (nested #:style bs-student-style content))

(define (teacher . content)
  (nested #:style bs-teacher-style content))

(define (pacing #:type (type #f) . contents) 
  (nested #:style (bootstrap-span-style type)
          (nested #:style bs-callout-style (interleave-parbreaks contents))))

(define (points . contents)
  (nested 
   (apply itemlist/splicing contents #:style (make-style "lesson" '(compact)))
   "\n" "\n"
   (insert-toggle-buttons)))

(define (point . contents)
  ;(item (nested (interleave-parbreaks contents))))
  (item (nested contents)))

(define (exercises . content)
  (lesson-section "Exercises" content))

;; Needed to avoid Sintraparas from being introduced between items in a list of content
(define (interleave-parbreaks contentlist)
  (cond [(empty? contentlist) (list "\n" "\n")]
        [(cons? contentlist) 
         (cons "\n" (cons "\n" (cons (first contentlist) (interleave-parbreaks (rest contentlist)))))]))

(define (lesson/studteach
         #:title (title #f)
         #:duration (duration #f)
         #:overview (overview #f)
         #:learning-objectives (learning-objectives #f)
         #:product-outcomes (product-outcomes #f)
         #:standards (standards #f)
         #:materials (materials #f)
         #:preparation (preparation #f)
         #:video (video #f)
         #:pacings (pacings #f)
         . body)
  
  (define the-lesson-name 
    (or (current-lesson-name) 
        (symbol->string (gensym (string->symbol (or title 'lesson))))))
  
  (define video-elem (cond [(and video (list? video))
                            (map (lambda (v) (elem #:style bs-video-style v)) video)]
                           [video (elem #:style bs-video-style video)]
                           [else (elem)]))
  (traverse-block
   (lambda (get set!)
     (define anchor (lesson-name->anchor-name the-lesson-name))
     (set! 'bootstrap-lessons (cons (lesson-struct title
                                                   duration
                                                   anchor)
                                    (get 'bootstrap-lessons '())))     
     (nested
      (para #:style bs-page-title-style title)
      "\n" "\n"
      (nested-flow 
       (bootstrap-div-style "content")
       (list
        ;(include-ssi)
        (nested #:style (bootstrap-sectioning-style "overview")
                (interleave-parbreaks
                 (list
                  (nested #:style bs-logo-style (image logo.png "bootstrap logo"))
                  ;; agenda would insert here
                  (nested #:style bs-lesson-title-style
                          (nested #:style bs-lesson-name-style "Overview"))
                  overview
                  ;(lesson-section "Overview" overview)
                  (lesson-section "Learning Objectives" learning-objectives)
                  (lesson-section "Product Outcomes" product-outcomes)
                  (lesson-section "Standards" standards)
                  (lesson-section "Materials" materials)
                  (lesson-section "Preparation" preparation)
                  )))
        (nested #:style (bootstrap-div-style "segment")
                (interleave-parbreaks
                 (list
                  (elem #:style (style #f (list (url-anchor anchor) (make-alt-tag "span"))))
                  (nested #:style bs-lesson-title-style
                          (interleave-parbreaks
                           (cons (para #:style bs-lesson-name-style 
                                       (interleave-parbreaks
                                        (list (elem title) 
                                              video-elem
                                              (cond [duration
                                                     (elem #:style bs-time-style (format "(Time ~a)" duration))]
                                                    [else (elem)]))))
                                 pacings)))
                  (interleave-parbreaks body))))
        ))))))

(define (lesson-section title contents)
  (when contents
    (nested (interleave-parbreaks (list (bold title) contents)))))

;;;;;;;;;;;;;;;; END NEW LESSON FORMAT ;;;;;;;;;;;;;;;;;;;;;;;;

(define (main-contents . body)
  (nested #:style (make-style #f 
                              (append (list (make-alt-tag "div") 
                                            ;(make-body-id "body")
                                            (make-attributes (list (cons 'id "body")))
                                      )
                                      css-js-additions))
          (nested #:style (bootstrap-div-style "item") 
                  body)))

(define (unit-separator unit-number)
  (elem #:style "BSUnitSeparationPage" (format "Lesson ~a" unit-number)))

;; unit-descr : list[element] -> block
;; stores the unit description to use in building the summary, then generates the text
(define-syntax (unit-descr stx)
  (syntax-case stx ()
    [(_ body ...)
     (syntax/loc stx
       (begin
         (set! current-the-unit-description (list body ...))
         current-the-unit-description))]))


;;;;;;;;;;;;; Generating the Main Summary Page ;;;;;;;;;;;;;;;;;

;; get-unit-descr : string -> pre-content
;; extract the content for the unit-descr from the unit with the given name
(define (get-unit-descr unit-name)
  (define result
    (dynamic-require (build-path (get-units-dir) unit-name "the-unit.scrbl")
                     'the-unit-description
                     (lambda ()
                       #f)))
  (if result
      result
      (begin 
        (printf "WARNING: no unit-descr for ~a~n" unit-name)
        "")))


;;@summary-item/links["Student Workbook" "resources/workbook/StudentWorkbook" #:ext1 "pdf" #:ext2 "odt"]{

;; summary-item/links : string string content -> block
;; generate a summary entry links to html and pdf versions as
;;   used on the main page for a course
(define (summary-item/links name basefilename 
                            #:label1 (label1 "html") #:ext1 (ext1 "html") 
                            #:label2 (label2 "pdf") #:ext2 (ext2 "pdf") 
                            . descr)
  (apply summary-item/custom name
         (list (hyperlink (format "~a.~a" basefilename ext1) label1)
               (hyperlink (format "~a.~a" basefilename ext2) label2))
         descr))

;; summary-item/custom : string list[hyperlink] pre-content -> block
;; generate a summary entry with given hyperlinks
;;   used on the main page for a course
;; CURRENTLY HANDLES ONLY TWO LINKS -- MUST GENERALIZE TO MORE
(define (summary-item/custom name links . descr)
  (para #:style "BSUnitSummary"
        (elem #:style "BSUnitTitle" name)
        " ["
        (elem (first links))      
        " | "
        (elem (second links))
        "] - "
        descr))

;; unit-summary/links : number content -> block
;; generate the summary of a unit with links to html and pdf versions as
;;   used on the main page for the BS1 curriculum
(define (unit-summary/links num)
  (summary-item/links (format "Unit ~a" num)
                      (format "units/unit~a/the-unit" num)
                      (get-unit-descr (format "unit~a" num))))

;;;;;;;;;;;;; End of Generating Main Summary Page ;;;;;;;;;;;;;;;

(define (drill . body)
  (compound-paragraph (bootstrap-sectioning-style "BootstrapDrill")
                      (decode-flow body)))

(define (exercise . body) 
  (list (compound-paragraph bs-header-style
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

(define (activity . body)
  (nested #:style (bootstrap-div-style "activity")
        body))
  

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
              (unless (or (null? col-content) (= (length col-content) numDataRows))
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
    (table (style #f
                  (list (table-columns
                         (build-list numCols
                                     (lambda (n) (style #f '(left)))))))
           ;; convert list of columns to list of rows
           (build-list (if (null? col-headers) numDataRows (add1 numDataRows))
                       (lambda (row-num) 
                         (map (lambda (col) (list-ref col row-num))
                              all-columns))))))

(define (standards . body)
  (list "State Standards: "
        (para (bootstrap-sectioning-style "BootstrapStandards")
              (decode-flow body))))

(define (unit-length timestr)
  (list (format "Length: ~a~n" (decode-flow timestr))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (materials . items)
  (list (compound-paragraph bs-header-style 
                            (decode-flow (list "Materials and Equipment:")))
        (apply itemlist/splicing items #:style "BootstrapMaterialsList")))

(define (goals . items)
  (list "Goals:"
        (apply itemlist/splicing items #:style "BootstrapGoalsList")))

(define (do-now . items)
  (list "Do Now:"
        (apply itemlist/splicing items #:style "BootstrapDoNowList")))

(define (objectives . items)
  (list (compound-paragraph bs-header-style 
                            (decode-flow (list "Learning Objectives:")))
        (apply itemlist/splicing items #:style "BootstrapLearningObjectivesList")))

(define (product-outcomes . items)
  (list (compound-paragraph bs-header-style 
                            (decode-flow (list "Product Outcomes:")))
        (apply itemlist/splicing items #:style "BootstrapProductOutcomesList")))

(define (preparation . items)
  (list (compound-paragraph bs-header-style 
                            (decode-flow (list "Preparation:")))
        (apply itemlist/splicing items #:style "BootstrapPreparationList")))



;; Cooperates with the Lesson tag.
(define (agenda . items)
  
  ;; extract-minutes: lesson-struct -> string
  ;; Extracts the number of minutes the lesson should take.
  (define (extract-minutes a-lesson)
    (first (regexp-match "[0-9]*" (lesson-struct-duration a-lesson))))
  
  
  (traverse-block
   (lambda (get set)
     
     (lambda (get set)
       
       (define (maybe-hyperlink elt anchor)
         (if anchor
             (hyperlink (string-append "#" anchor) elt)
             elt))
       
       (define lessons (reverse (get 'bootstrap-lessons '())))
       
       (nested #:style (style "BootstrapAgenda" '(never-indents))
               (list "Agenda"
                     (apply 
                      itemlist/splicing 
                      #:style "BootstrapAgendaList"
                      (for/list ([a-lesson lessons])
                        (item (para (elem #:style "BSLessonDuration"
                                          (format "~a min" 
                                                  (extract-minutes a-lesson)))
                                    (maybe-hyperlink
                                     (elem #:style "BSLessonName"
                                           (lesson-struct-title a-lesson))
                                     (lesson-struct-anchor a-lesson))))))))))))

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
                  [(item? i)
                   (cons i acc)]
                  [else
                   (cons (item i) acc)]))
              acc
              items))))
  (apply itemlist spliced-items #:style style))


;; lesson-module-path->lesson-name: module-path -> string
(define (lesson-module-path->lesson-name mp)
  (match mp
    [(list 'lib path)
     (cond
       [(regexp-match #px"^curr/lessons/([^/]+)/lesson/lesson.scrbl$" path)
        =>
        (lambda (result)
          (list-ref result 1))]
       [else
        (raise-lesson-error mp)])]
    [else
     (raise-lesson-error mp)]))


;; raise-lesson-error: module-path -> void
;; Raises a lesson-specific error.
(define (raise-lesson-error mp)
  (error 'extract-lesson "lesson module path ~e does not have expected shape (e.g. (lib curr/lib/FOO/lesson.scrbl)" mp))



;; extract-lesson: module-path -> (listof block)
;; Extracts the lesson from the documentation portion, and also
;; registers the use in the current document.
(define (extract-lesson mp)
  (define lesson-name (lesson-module-path->lesson-name mp))
  (define a-doc (parameterize ([current-lesson-name lesson-name])
                  (dynamic-require mp 'doc)))
  
  (unless (part? a-doc)
    (error 'include-lesson "doc binding is not a part: ~e" a-doc))
  (hash-set! (current-lesson-xref) lesson-name (list lesson-name (current-document-output-path)))
  
  (part-blocks a-doc))


(define-syntax (include-lesson stx)
  (syntax-case stx ()
    [(_ mp)
     (with-syntax ([(temporary-name) (generate-temporaries #'(mp))])
       (syntax/loc stx
         (extract-lesson 'mp)))]))


;; lesson-name->anchor-name: string -> string
;; Given that the lesson names are unique, we can create an <a name="..."> anchor
;; for each included lesson.  We put a "lesson_" prefix in front of each name.
(define (lesson-name->anchor-name a-name)
  (uri-encode (string-append "lesson_" a-name)))




;; Link to a particular lesson by name
;; lesson-link: #:name string #:label (U string #f) -> element
(define (lesson-link #:name lesson-name
                     #:label [label #f])
  ;; We make this a traverse-element so that we can re-evaluate this code at document-generation
  ;; time, rather than just at module-loading time.
  (traverse-element 
   (lambda (get set)
     (cond
       ;; First, check to see whether or not we can find the cross reference to the lesson.
       [(and (hash-has-key? (current-lesson-xref) lesson-name)
             (current-document-output-path))
        (define-values (unit-path anchor)
          (match (hash-ref (current-lesson-xref) lesson-name)
            [(list lesson-name unit-path)
             (values unit-path (lesson-name->anchor-name lesson-name))]))
        (define the-relative-path
          (find-relative-path (simple-form-path (path-only (current-document-output-path)))
                              (simple-form-path unit-path)))
        (hyperlink (string-append (path->string the-relative-path) "#" anchor)
                   (if label label lesson-name))]
       
       ;; If not, fail for now by producing a hyperlink that doesn't quite go to the right place.
       [else
        (fprintf (current-output-port) "Warning: could not find cross reference to ~a\n" lesson-name)
        (define the-relative-path
          (find-relative-path (simple-form-path (current-directory))
                              (simple-form-path (build-path worksheet-lesson-root lesson-name "lesson" "lesson.html"))))
        (hyperlink (path->string the-relative-path)
                   (if label label lesson-name))]))))



;;Vicki

;; Inputs: string list[element] -> nested-flow
;;         optional arguments are elements 
;; Generates all components of a design-recipe exercise.  Optional arguments fill in solutions
;;    for teacher's edition
(define (struct-design-recipe-exercise fields func-name . description)
  (let ([tagbase (format "recipe-~a" func-name)])
    (nested
     #:style (style "BootstrapDRExercise" '())
     
     ;(bootstrap-title (format "Design Recipe for ~a" func-name))
     (apply para #:style "BSRecipeExerciseDescr" description)
     (worksheet-segment "I. Contract + Purpose Statement")
     (elem "Every contract has three parts")
     "\n" "\n" 
     (contract-purpose-exercise tagbase)
     (make-element 'newline '("\n"))(make-element 'newline '("\n"))
     (worksheet-segment "II. Give Examples")
     (elem "Write two examples of your function in action")
     "\n" "\n" 
     (struct-example-with-text (string-append tagbase "ex1" ) fields)
     "\n" "\n"
     (struct-example-with-text (string-append tagbase "ex2") fields)
     (worksheet-segment "III. Function")
     "\n" "\n"
     (elem "Write the function header, giving variable names to all your input values")
     "\n""\n"
     (struct-function-exercise (string-append tagbase "function") fields)
     )))

;; input: -two optional text labels for the two fill-in-the-blanks 
;;        -a tag which can be anything unqiue which helps to generate a 
;;         unique id 
;;        number of fields in struct
;; output: in format (EXAMPLE ( /*with text1label*/ _____) /*with text2label*/ _____)
(define (struct-example-with-text #:text1 [text1 ""]
                                  #:text2 [text2 ""]
                                  tag
                                  #:example1 [example1 #f]
                                  #:example2 [example2 #f]
                                  fields)
  (cond-element 
   [html (apply elem (flatten-1 (list "(EXAMPLE ( " 
                                      (fill-in-the-blank #:id (format "~a.1" tag) #:label "function name")
                                      (fill-in-the-blank #:id (format "~a.1" tag) #:label "inputs")
                                      " ) ( " (fill-in-the-blank #:id (format "~a.2" tag) #:label "what it does") 
                                      
                                      (duplicate fields (list (make-element 'newline '("\n"))(fill-in-the-blank #:id (format "~a.2" tag) #:label "") ))
                                      
                                      " ))")))]
   [(or latex pdf) (elem #:style bs-example-exercise-style "")]))


;; input: optional values for the name, args, and body fields of a function
;;        a tag to use for generating html id names
;;        number of fields in struct
;; output: a define with text boxes formatted for inputs to the exercise
(define (struct-function-exercise #:name [name ""]
                                  #:args [args ""]
                                  #:body [body ""]
                                  tag
                                  fields)
  (cond-element 
   [html
    (apply elem (flatten-1 (list "(define ( "
                                 (fill-in-the-blank #:id (format "fname-~a" tag) #:label "function name")
                                 (fill-in-the-blank #:id (format "args-~a" tag) #:label "variable names") 
                                 " ) ( " (fill-in-the-blank #:id (format "body-~a" tag) #:label "what it does") 
                                 
                                 (duplicate fields (list (make-element 'newline '("\n"))(fill-in-the-blank #:id (format "~a.2" tag) #:label "") ))
                                 
                                 " ))")))]
   [(or latex pef) (elem #:style bs-function-exercise-style "")]))





(define (duplicate n things . _)
  (let ((res (if (eq? _ '()) '() (car _))))
    (if (= n 0)
        res
        (duplicate (- n 1) things (append things res)))))

(define (flatten-1 lol)
  (cond
    ((null? lol) lol)
    ((list? (car lol)) (append (car lol) (flatten-1 (cdr lol))))
    (#t (cons (car lol) (flatten-1 (cdr lol))))))


;;interns

;; Inputs: string list[element] -> nested-flow
;;         optional arguments are elements 
;; Generates all components of a design-recipe exercise.  Optional arguments fill in solutions
;;    for teacher's edition
(define (design-recipe-exercise func-name . description)
  (let ([tagbase (format "recipe-~a" func-name)])
    (nested
     #:style (style "BootstrapDRExercise" '())
     
     ;(bootstrap-title (format "Design Recipe for ~a" func-name))
     (apply para #:style "BSRecipeExerciseDescr" description)
     (worksheet-segment "I. Contract + Purpose Statement")
     (elem "Every contract has three parts")
     "\n" "\n"
     (contract-purpose-exercise tagbase)
     (worksheet-segment "II. Give Examples")
     (elem "Write two examples of your function in action")
     "\n" "\n" 
     (example-with-text (string-append tagbase "ex1"))
     "\n" "\n"
     (example-with-text (string-append tagbase "ex2"))
     (worksheet-segment "III. Function")
     "\n" "\n"
     (elem "Write the function header, giving variable names to all your input values")
     "\n""\n"
     (function-exercise (string-append tagbase "function"))
     )))

;; Inputs: list[string or image] -> nested-flow
;; Generates all components of a math/circle-of-evaluation/racket exercise
;;    Corresponding LaTeX macro currently assumes 4 examples
;;    FIX:: HTML version currently lacks header and warning text
(define (circles-evaluation-exercise tag math-examples)
  [cond-element 
   [html (build-table/cols 
          (list "Math" "Circle of Evaluation" "Racket Code")
          math-examples
          (lambda (row-num col-num) (free-response (format "~ar~ac~a" tag row-num col-num))) 
          3 
          4)]
   [(or latex pdf) (apply elem #:style (make-bs-latex-style "BSCircEvalExercise") 
                          (map elem math-examples))]])

(define (overview #:gen-agenda? (gen-agenda? #t). body)
  (list
   (elem #:style (bootstrap-style "BootstrapOverviewTitle") (list (format "Unit Overview")))
   (if gen-agenda? (agenda) (elem))
   (compound-paragraph (bootstrap-sectioning-style "BootstrapOverview") (decode-flow body))
   ))

;; Inputs: string [string] [string] [string] -> element
;;         optional argument supply answers for the workbook
;; Produces element with blanks for an exercise to fill in a contract
(define (contract-exercise tag #:name [name-ans #f] #:domain [domain-ans #f] #:range [range-ans #f])
  (cond-element [html
                 (elem "; " (fill-in-the-blank #:id (format "~aname" tag) #:label "Name")
                       " : " (fill-in-the-blank #:id (format "~aarg" tag) #:label "Domain")
                       " -> " (fill-in-the-blank #:id (format "~aoutput" tag) #:label "Range"))]
                [(or latex pdf)
                 (elem #:style bs-contract-exercise-style "")]))

;; Inputs: string [string] [string] [string] string -> element
;;         optional argument supply answers for the workbook
;; Produces element with blanks for an exercise to fill in a contract and purpose
(define (contract-purpose-exercise tag #:name [name-ans #f] #:domain [domain-ans #f] #:range [range-ans #f]
                                   #:purpose [purpose-ans #f])
  (cond-element [html (list (contract-exercise tag #:name name-ans #:domain domain-ans #:range range-ans)
                            (make-element 'newline '("\n")) "; " (fill-in-the-blank #:id (format "~apurpose" tag) #:label "Purpose statement"))]
                [(or latex pdf)
                 (elem #:style bs-contract-purpose-exercise-style "")]))

;; Inputs: string
;; Produces an element for the title bar for a worksheet segment
(define (worksheet-segment title)
  (elem #:style (bootstrap-sectioning-style "BootstrapWorksheetSegment") (list title)))

;auto generates copyright section
(define (copyright . body)
  (para 
   (hyperlink "http://creativecommons.org/licenses/by-nc-nd/3.0/" creativeCommonsLogo) "Bootstrap by " (hyperlink "http://www.bootstrapworld.org/" "Emmanuel Schanzer") " is licensed under a "
   (hyperlink "http://creativecommons.org/licenses/by-nc-nd/3.0/" "Creative Commons 3.0 Unported License")
   ". Based on a work at " (hyperlink "http://www.bootstrapworld.org/" "www.BootstrapWorld.org")
   ". Permissions beyond the scope of this license may be available at "
   (hyperlink "mailto:schanzer@BootstrapWorld.org" "schanzer@BootstrapWorld.org") "."))

;autogenerates state-standards section
(define state-standards
  (list (elem #:style bs-header-style "State Standards")
        "See our " 
        (hyperlink "http://www.BootstrapWorld.org/materials/CommonCore.shtml" "Common Core Standards Table") 
        " provided as part of the Bootstrap curriculum."))

;creates the length of the lesson based on input
;input ONLY THE NUMBER!
(define (length-of-lesson l)
  (list (elem #:style bs-header-style (format "Length: ~a minutes" l))))

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



;; Link to a particular resource by path.
;; resource-path should be a path string relative to the resources subdirectory.
(define (resource-link #:path resource-path
                       #:label [label #f])
  (define the-relative-path
    (find-relative-path (simple-form-path (current-directory))
                        (simple-form-path (build-path (get-resources) resource-path))))
  (hyperlink (path->string the-relative-path)
             (if label label resource-path)))



;; wraps a hyperlink in the bootstrap styling tag
(define (video-link hylink)
  (elem #:style bs-video-style hylink))


;; Creates a link to the worksheet.
;; Under development mode, the URL is relative to the development sources.
;; Under deployment mode, the URL assumes worksheets have been written 
(define (worksheet-link #:name name
                        #:page page
                        #:lesson [lesson #f]
                        #:src-path src-path)
  
  (define-values (base-path _ dir?) (split-path src-path))
  (define the-relative-path
    (find-relative-path (simple-form-path (current-directory))
                        (cond 
                          ;; FIXME: communicate parameter values via parameters.
                          ;; The reason it's not working right now is because we're
                          ;; calling into scribble with system*, which means we don't
                          ;; get to preserve any parameters between the build script
                          ;; and us.
                          [(getenv "WORKSHEET-LINKS-TO-PDF")
                           (simple-form-path (get-worksheet-pdf-path))]
                          [lesson
                           (simple-form-path (build-path worksheet-lesson-root
                                                         lesson
                                                         "worksheets"
                                                         (format "~a.html" name)))]
                          [else
                           (simple-form-path (build-path base-path
                                                         'up
                                                         "worksheets"
                                                         (format "~a.html" name)))])))
  (list (hyperlink (path->string the-relative-path)
                   "Page " (number->string page))))

;; generates the title, which includes the bootstrap logo in html but not in latex/pdf
;; In unit+title case, paras shouldn't be there but that throws off the CSS spacing -- FIX
(define (bootstrap-title #:single-line [single-line #f] . body)
  (define the-title (apply string-append body))
  (define unit+title (if single-line #f (regexp-match #px"^([^:]+):\\s*(.+)$" the-title))) 
  (define bootstrap-image (cond-element 
                           [html bootstrap.gif]
                           [(or latex pdf) (elem)]))
  (cond 
    [unit+title (list (para (elem #:style bs-title-style (list bootstrap-image (second unit+title))))
                      "\n"
                      (para (elem #:style bs-title-style (third unit+title))))]
    [else (elem #:style bs-title-style (cons bootstrap-image body))]))

;;;;;;;;;;;;;; Javascript Generation ;;;;;;;;;;;;;;;;;;;;;;;;

;; generates a button that checks given constraint when clicked
;; NEED TO document the language of the constraint input
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
