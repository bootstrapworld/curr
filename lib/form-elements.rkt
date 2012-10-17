#lang racket/base

(require (prefix-in wescheme: "wescheme.rkt")
         racket/runtime-path
         racket/stxparam
         racket/contract
         scribble/base
         scribble/core
         scribble/decode
         scribble/basic
         (prefix-in manual: scribble/manual)
         scribble/html-properties
         scribble/latex-properties
         scriblib/render-cond
         racket/path
         (for-syntax racket/base)
         2htdp/image
         racket/list
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
         
         ;; Sections
         worksheet
         worksheet-segment
         lesson
         drill
         exercise
	 skit
	 demo
	 review
         unit-separator
         unit-descr

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

         resource-link
         lesson-link
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

;;;;;;;;;;;;;;;; Defining Styles ;;;;;;;;;;;;;;;;;;;;;;;;;

;; bootstrap-sectioning-style : string -> style
;; defines a style for a section based on the <div> tag
(define (bootstrap-sectioning-style name)
  (make-style name (list (make-css-addition bootstrap.css)
                         (make-tex-addition bootstrap-pdf.tex)
                         ;; Use <div/> rather than <p/>
                         (make-alt-tag "div")
                         )))

;; bootstrap-style : string -> style
;; defines a style for both latex and css with the given name
(define (bootstrap-style name)
  (make-style name (list (make-css-addition bootstrap.css)
                         (make-tex-addition bootstrap-pdf.tex)
                         )))

(define bs-header-style (bootstrap-style "BootstrapHeader"))
(define bs-title-style (bootstrap-style "BootstrapTitle"))
(define bs-lesson-title-style (bootstrap-style "BootstrapLessonTitle"))
(define bs-lesson-name-style (bootstrap-style "BSLessonName"))
(define bs-lesson-duration-style (bootstrap-style "BSLessonDuration"))
(define bs-video-style (bootstrap-style "BootstrapVideo"))

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
  (list question
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
         (manual:codeblock (string-append (if contract (string-append "; " contract "\n") "")
                                          (if purpose (string-append "; " purpose "\n") "")
                                          (apply string-append body)))]
        [contract (manual:code (string-append "; " contract))]
        [purpose (manual:code (string-append "; " purpose))]
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
  (let ([video-elem (cond [(and video (list? video))
                           (map (lambda (v) (elem #:style bs-video-style v)) video)]
                          [video (elem #:style bs-video-style video)]
                          [else (elem)])])
    (traverse-block
     (lambda (get set!)
       (set! 'bootstrap-lessons (cons (lesson-struct title duration) (get 'bootstrap-lessons '())))     
       
       (nested-flow
        (style "BootstrapLesson" '())
        (decode-flow
         (list (cond [(and title duration)
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
             (compound-paragraph (bootstrap-sectioning-style "BootstrapLesson")
                                 (decode-flow body)))))))))

(define (unit-separator unit-number)
  (elem #:style "BSUnitSeparationPage" (format "Lesson ~a" unit-number)))

;; unit-descr : list[element] -> block
;; stores the unit description to use in building the summary, then generates the text
(define (unit-descr . body)
  (para body))

;;;;;;;;;;;;; Generating the Main Summary Page ;;;;;;;;;;;;;;;;;

;; get-unit-descr : string -> string
;; extract the string for the unit-descr from the unit with the given name
(define (get-unit-descr unit-name)
  (with-input-from-file (build-path (get-units-dir) unit-name "the-unit.scrbl")
    (lambda ()
      (let ([ud-spec (regexp-match #rx"@unit-descr{.*?}" (read-string 5000))])
        (if ud-spec
            (substring (first ud-spec) 12 (- (string-length (first ud-spec)) 1))
            (begin (printf "WARNING: no unit-descr for ~a~n" unit-name)
                   ""))))))

;;@summary-item/links["Student Workbook" "resources/workbook/StudentWorkbook" #:ext1 "pdf" #:ext2 "odt"]{

;; summary-item/links : string string content -> block
;; generate a summary entry links to html and pdf versions as
;;   used on the main page for a course
(define (summary-item/links name basefilename 
                            #:label1 (label1 "html") #:ext1 (ext1 "html") 
                            #:label2 (label2 "pdf") #:ext2 (ext2 "pdf") 
                            . descr)
  (para #:style "BSUnitSummary"
        (elem #:style "BSUnitTitle" name)
        " ["
        (elem (hyperlink (format "~a.~a" basefilename ext1) label1))         
        " | "
        (elem (hyperlink (format "~a.~a" basefilename ext2) label2))
        " ] - "
        (apply elem descr)
        ))

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
  (traverse-block
   (lambda (get set)
     
     (lambda (get set)
       (define lessons (reverse (get 'bootstrap-lessons '())))
       
       (nested-flow
        (style "BootstrapAgenda" '(never-indents))
        (decode-flow
         (list "Agenda"
               (apply 
                itemlist/splicing 
                #:style "BootstrapAgendaList"
                (map (lambda (a-lesson)
                       (item (para (span-class "BSLessonDuration"
                                               (format "~a min" 
                                                       (first (regexp-match "[0-9]*" (lesson-struct-duration a-lesson)))))
                                   (span-class "BSLessonName" (lesson-struct-title a-lesson)))))
                     lessons))
               )))))))

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

(define (extract-lesson p)
  (unless (part? p)
    (error 'include-lesson "doc binding is not a part: ~e" p))
  (part-blocks p))

(define-syntax (include-lesson stx)
  (syntax-case stx ()
    [(_ mp)
     (with-syntax ([(temporary-name) (generate-temporaries #'(mp))])
       (syntax/loc stx
         (begin
           (define a-doc (dynamic-require 'mp 'doc))
           (extract-lesson a-doc)
           )))]))

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
                 (elem ";" (fill-in-the-blank #:id (format "~aname" tag) #:label "Name")
                       ":" (fill-in-the-blank #:id (format "~aarg" tag) #:label "Domain")
                       "->" (fill-in-the-blank #:id (format "~aoutput" tag) #:label "Range"))]
                [(or latex pdf)
                 (elem #:style bs-contract-exercise-style "")]))

;; Inputs: string [string] [string] [string] string -> element
;;         optional argument supply answers for the workbook
;; Produces element with blanks for an exercise to fill in a contract and purpose
(define (contract-purpose-exercise tag #:name [name-ans #f] #:domain [domain-ans #f] #:range [range-ans #f]
                                   #:purpose [purpose-ans #f])
  (cond-element [html (list (contract-exercise tag #:name name-ans #:domain domain-ans #:range range-ans)
                            ";" (fill-in-the-blank #:id (format "~apurpose" tag)))]
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
        "See " 
        (hyperlink "https://spreadsheets.google.com/a/brown.edu/pub?key=0Ak3Voejjnf0ldHlQcXRVWTZDbVprWHlBLTJWRlQ2dkE&hl=en&gid=0" "Bootstrap Standards Matrix") 
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


;; Link to a particular lesson by name
(define (lesson-link #:name lesson-name
                     #:label [label #f])
  (define the-relative-path
    (find-relative-path (simple-form-path (current-directory))
                        (simple-form-path (build-path worksheet-lesson-root lesson-name "lesson" "lesson.html"))))
  (hyperlink (path->string the-relative-path)
             (if label label lesson-name)))

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
