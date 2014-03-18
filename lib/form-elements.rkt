#lang racket/base

(require racket/runtime-path
         racket/stxparam
         racket/contract
         racket/string
         racket/port
         racket/system ;; for extracting info from exercise handouts
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
         (prefix-in neturl: net/url) ;; so we can load mathjax from a url
         racket/match
         "compile-time-params.rkt"
         "system-parameters.rkt"
         "checker.rkt"
         "javascript-support.rkt"
         "paths.rkt"
         "tags.rkt"
         "scribble-helpers.rkt"
         "standards-csv-api.rkt"
         "standards-dictionary.rkt"
         "glossary-terms.rkt"
         "sexp-generator.rkt"
         "auto-format-within-strings.rkt"
         "workbook-index-api.rkt"
         )



;; FIXME: must add contracts!
(provide row
         current-row
         fill-in-the-blank
         free-response
         drop-down
         think-about
         vocab
         code
         math
         bannerline
         new-paragraph
         animated-gif
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
         summary-item/unit-link
         matching-exercise
         matching-exercise-answers
         completion-exercise
         open-response-exercise
         questions-and-answers
         circeval-matching-exercise/code
         circeval-matching-exercise/math
         fill-in-blank-answers-exercise
         gen-random-arith-sexp
         sexp
         sexp-answer
         sexp->math
	 sexp->coe
	 sexp->code
         make-exercise-locator
         exercise-handout
         exercise-answers
         exercise-evid-tags
         solutions-mode-on?
         create-itemlist
         create-exercise-itemlist
         create-exercise-itemlist/contract-answers
         create-exercise-sols-itemlist
         matching-exercise-sols
         three-col-exercise
         three-col-answers
         editor-link
         run-link
         login-link
         
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
         itemlist/splicing ;; need because bs1 teachers-guide.scrbl using it (still in old lesson format)
         
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
         unit-overview/auto
         unit-lessons
         overview
         copyright
         example-with-text
         example-fast-functions
         state-standards
         length-of-lesson
         bootstrap-title
         augment-head
         
         ;; stuff added by Vicki
         struct-example-with-text
         struct-design-recipe-exercise
         struct-function-exercise
         
         [rename-out [worksheet-link/src-path worksheet-link]]
         
         resource-link
         video-link
         )        

(provide/contract [check
                   (-> constraint? element?)]
                  )

;(provide-for-syntax 
;         solutions-mode-on?/syntax
;         )

;;;;;;;;;;;;;;;; Site Images ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define bootstrap.gif (bitmap "bootstrap.gif"))
(define creativeCommonsLogo (bitmap "creativeCommonsLogo.png"))

;;;;;;;;;;;;;;;;; URLs ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define mathjax-url
  (neturl:string->url 
   "http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML,http://www.cs.wpi.edu/~kfisler/mathjaxlocal.js"))
  
;; aud is either a string or a list of strings of audience tags
;;  known tags are student, teacher, volunteer, and self-taught
(define (audience-in? aud)
  (member (getenv "AUDIENCE") (if (list? aud) aud (list aud))))

;;;;;;;;;;;;;;;; Runtime Paths ;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-runtime-path bootstrap.css "bootstrap.css")
(define-runtime-path bootstrap-pdf.tex "bootstrap-pdf.tex")
(define-runtime-path worksheet-lesson-root (build-path 'up "lessons"))
(define-runtime-path textbook.css "textbook.css")
(define-runtime-path pretty-printing.css "pretty-printing.css")
(define-runtime-path cards.css "cards.css")
(define-runtime-path codemirror.js "codemirror.js")
(define-runtime-path codemirror.css "codemirror.css")
(define-runtime-path runmode.js "runmode.js")
(define-runtime-path scheme2.js "scheme2.js")
(define-runtime-path bootstraplesson.js "bootstraplesson.js")
(define-runtime-path logo.png "logo.png")
;(define-runtime-path mathjaxlocal.js "mathjaxlocal.js")
(define-runtime-path extra_curriculum.css "extra_curriculum.css")

(define css-js-additions
  (list (make-tex-addition bootstrap-pdf.tex)
        (if (audience-in? (list "student"))
            (make-css-addition cards.css)
            (make-css-addition textbook.css))
        (make-css-addition pretty-printing.css)
        (make-css-addition codemirror.css)
        (make-js-addition codemirror.js)
        (make-js-addition runmode.js)
        (make-js-addition scheme2.js)
        (make-js-addition bootstraplesson.js)
        ;(make-js-addition mathjaxlocal.js)
        (make-js-addition mathjax-url)
        (make-css-style-addition extra_curriculum.css)
        ))

;; add meta attributes to HEAD (needed for iPhone rendering)
(define bs-head-additions
  (make-head-extra 
   '(meta ((name "viewport")
           (content "width=device-width, initial-scale=1, user-scalable=no")))))

;;;;;;;;;;;;;;;; Defining Styles ;;;;;;;;;;;;;;;;;;;;;;;;;

;; bootstrap-sectioning-style : string -> style
;; defines a style for a section based on the <div> tag
(define (bootstrap-sectioning-style name)
  (make-style name (cons (make-alt-tag "div")
                         css-js-additions)))

(define (bootstrap-paragraph-style name)
  (make-style name css-js-additions))

(define (bootstrap-div-style name)
  (make-style name (cons (make-alt-tag "div")
                         css-js-additions)))  

(define (bootstrap-div-style/id name)
  (make-style #f (cons (make-alt-tag "div")
                       (cons 
                        (make-attributes (list (cons 'id name)))
                        css-js-additions))))

(define (bootstrap-div-style/id/nested name)
  (make-style "" (cons (make-alt-tag "div")
                       (cons 
                        (make-attributes (list (cons 'class "")
                                               (cons 'id name)))
                        css-js-additions))))

(define (bootstrap-div-style/extra-id name id)
  (make-style name (cons (make-alt-tag "div")
                         (cons 
                          (make-attributes (list (cons 'class "")
                                                 (cons 'id id)))
                          css-js-additions))))

(define (bootstrap-span-style/extra-id name id)
  (make-style name (cons (make-alt-tag "span")
                         (cons 
                          (make-attributes (list ;(cons 'class "")
                                                 (cons 'id id)))
                          css-js-additions))))

(define (bootstrap-span-style name)
  (make-style name (cons (make-alt-tag "span")
                         css-js-additions)))

(define (bootstrap-span-style/id name)
  (make-style #f (cons (make-alt-tag "span")
                       (cons (make-attributes (list (cons 'id name)))
                             css-js-additions))))

(define bootstrap-agenda-style
  (make-style "" (cons 'never-indents
                       (cons (make-alt-tag "div")
                             (cons (make-attributes (list (cons 'id "BootstrapAgenda")))
                                   css-js-additions)))))

;; bootstrap-style : string -> style
;; defines a style for both latex and css with the given name
(define (bootstrap-style name)
  (make-style name (cons (make-alt-tag "span")
                         css-js-additions)))

(define bs-header-style (bootstrap-paragraph-style "BootstrapHeader"))
(define bs-header-style/span (bootstrap-span-style "BootstrapHeader"))
(define bs-title-style (bootstrap-style "BootstrapTitle"))
(define bs-lesson-title-style (bootstrap-style "BootstrapLessonTitle"))
(define bs-lesson-name-style (bootstrap-style "BSLessonName"))
(define bs-lesson-duration-style (bootstrap-style "BSLessonDuration"))
(define bs-video-style (bootstrap-style "BootstrapVideo"))
(define bs-page-title-style (bootstrap-style "BootstrapPageTitle"))
(define bs-content-style (bootstrap-div-style "content"))

;; new lesson styles
(define bs-time-style (bootstrap-span-style "time"))
(define bs-callout-style (bootstrap-div-style "callout"))
(define bs-student-style (bootstrap-div-style "student"))
(define bs-teacher-style (bootstrap-div-style "teacher"))
(define bs-logo-style (bootstrap-span-style "BootstrapLogo"))
(define bs-vocab-style (bootstrap-span-style "vocab"))
(define bs-banner-style (bootstrap-div-style "banner"))
(define bs-sexp-style (bootstrap-div-style "codesexp"))
(define bs-code-style (bootstrap-div-style "code"))
(define bs-circeval-style (bootstrap-div-style "circleevalsexp"))
(define bs-numvalue-style (bootstrap-span-style "value wescheme-number"))
(define bs-strvalue-style (bootstrap-span-style "value wescheme-string"))
(define bs-symvalue-style (bootstrap-span-style "value wescheme-symbol"))
(define bs-boolvalue-style (bootstrap-span-style "value wescheme-boolean"))
(define bs-clause-style (bootstrap-span-style "wescheme-clause"))
(define bs-comment-style (bootstrap-div-style "wescheme-comment"))
(define bs-expr-hole-style (bootstrap-span-style "studentAnswer"))
;(define bs-expr-hole-style (bootstrap-span-style "partial-expr-hole"))
(define bs-example-style (bootstrap-span-style "wescheme-example"))
(define bs-example-left-style (bootstrap-span-style "wescheme-example-left"))
(define bs-example-right-style (bootstrap-span-style "wescheme-example-right"))
(define bs-keyword-style (bootstrap-span-style "wescheme-keyword"))
(define bs-openbrace-style (bootstrap-span-style "lParen"))
(define bs-closebrace-style (bootstrap-span-style "rParen"))
(define bs-operator-style (bootstrap-span-style "operator"))
(define bs-expression-style (bootstrap-span-style "expression"))
(define bs-define-style (bootstrap-span-style "wescheme-define"))
(define bs-handout-style (bootstrap-div-style/extra-id "segment" "exercises"))
(define bs-exercise-instr-style (bootstrap-div-style "exercise-instr"))

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
(define bs-head-style (make-style #f (list bs-head-additions)))

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


(define interactive-mode? #f)

;; Inputs: string number string string -> element
;; Generates a single-line input area
(define (fill-in-the-blank #:id (id "nonunique-id")
                           #:columns (width 50)
                           #:label (label #f)
                           #:class (classname #f)
                           #:answer (answer #f))
  (cond-element [html
                 (if interactive-mode?
                     (sxml->element `(input (@ (type "text")
                                               (id ,(resolve-id id))
                                               (width ,(number->string width))
                                               ,@(if label
                                                     `((placeholder ,label))
                                                     '()))
                                            ""))
                     (elem #:style (bootstrap-span-style classname) ""))] ;"answer here"
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

(define (escape-webstring-newlines str)
  (string-replace str (list->string (list #\newline)) "%0A"))

;; create a link to a wescheme editor, possibly initialized with interactions/defn contents
(define (editor-link #:public-id (pid #f)
                     #:interactions-text (interactions-text #f)
                     #:definitions-text (definitions-text #f)
                     link-text)                      
  (if (and definitions-text pid)
      (printf "WARNING: creating wescheme link with both defns text and public id~n")
      (let ([optionstext (if (audience-in? (list "student"))
                             "hideHeader=true&warnOnExit=false&"
                             "")]
            [argstext (string-append (if pid (format "publicId=~a&" pid) "")
                                     (if interactions-text (format "interactionsText=~a&" interactions-text) "")
                                     (if definitions-text (format "definitionsText=~a" (escape-webstring-newlines definitions-text)) ""))])
        (cond-element
         [html
          (sxml->element `(a (@ (href ,(format "http://www.wescheme.org/openEditor?~a~a" optionstext argstext))
                                (target "embedded"))
                             ,link-text))]
         [else (elem)]))))

;; create a link to a particular program at wescheme.org, with the embedded target
(define (run-link #:public-id (pid #f) link-text)
  (if (not pid)
      (printf "WARNING: run-link needs a public-id argument")
      (cond-element
       [html
        (sxml->element `(a (@ (href ,(format "http://www.wescheme.org/view?publicId=~a" pid))
                              (target "embedded"))
                           ,link-text))]
       [else (elem)])))

;; create a link to wescheme.org's home page, with the embedded target
(define (login-link link-text)
  (cond-element
   [html
    (sxml->element `(a (@ (href "http://www.wescheme.org/")
                          (target "embedded"))
                       ,link-text))]
   [else (elem)]))
  
  
  
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

;; accumulate all vocab referenced in lesson so we can generate a glossary
(define (vocab body)
  (traverse-element
   (lambda (get set)
     (set 'vocab-used (cons body (get 'vocab-used '())))
     (elem #:style bs-vocab-style body))))

;; generate math rendering towards the MathJax library
(define (math body)
  (cond-element
   [html (sxml->element `(script (@ (type "math/tex"))
                                 ,body))]
   [(or latex pdf)
    (printf "WARNING: IMPLEMENT MATH MODE for latex/pdf")])) 

;; generate content to be styled as its own line in a block
(define (bannerline  . body)
  (elem #:style bs-banner-style body))

;; add a paragraph break by inserting two linebreaks
(define (new-paragraph)
  (list (linebreak) (linebreak)))

;; insert animated gif into file
(define (animated-gif path-as-str)
  (let ([path-strs (string-split path-as-str "\\")])
    (image (apply build-path path-strs))))

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
    ;; the nbsp is there to hack around a rendering error that occurs when
    ;; an activity is immediately followed by code
    (cond-element 
     [html (if multi-line 
               (elem (list (sxml->element 'nbsp) (sxml->element `(textarea ,(string-append "\n" allcode "\n")))))
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

; the extra class "fixed" in the toolbar is for consistency with what gets
; generated when we add the toolbar id through a bootstrap-div-style/id
; for the student toolbar
(define (insert-teacher-toggle-button)
  (cond-element
   [html (sxml->element
          `(div (@ (class "fixed") (id "lessonToolbar"))
                (input (@ (type "button") 
                          (value "Show Teacher Notes") 
                          (onclick "toggleTeacherNotes(this);")) "")
                (br)
                (input (@ (type "button")
                          (value "Discussion Group")
                          (onclick "showGroup()")))))]
   [else (elem)]))

(define (insert-student-buttons)
  (cond-element
   [html (sxml->element
          `(center
            (input (@ (type "button") (id "prev")   (value "<<")) "")
            (input (@ (type "button") (id "flip")   (value "flip")) "")
            (input (@ (type "button") (id "next")   (value ">>")) "")
            ))]
   [else (elem "")]))

(define (insert-toolbar)
  (cond [(audience-in? (list "teacher" "volunteer")) (insert-teacher-toggle-button)]
        [(audience-in? (list "student")) 
         (list
          (para #:style (bootstrap-div-style/id "lessonToolbar")
                (insert-student-buttons))
          (cond-element
           [html (sxml->element
                  `(div (@ (id "IDE"))
                        (iframe (@ (id "embedded") (name "embedded")))))]
           [else (elem)]))]
        [else (elem)]))

(define (student . content)
  (nested #:style bs-student-style (interleave-parbreaks/select content)))

(define (teacher . content)
  (nested #:style bs-teacher-style (interleave-parbreaks/select content)))

(define (pacing #:type (type #f) . contents) 
  (nested #:style (bootstrap-span-style type)
          (nested #:style bs-callout-style (interleave-parbreaks/all contents))))

(define (points . contents)
   (apply itemlist/splicing contents #:style (make-style "lesson" '(compact))))

(define (point . contents)
  (interleave-parbreaks/select contents)) 

(define (exercises . content)
  (lesson-section "Exercises" content))

;; determine which elements need manual parbreaks to prevent surrounding SIntraparas
;; currently suppress around itemizations and student/teacher blocks
(define (suppress-intrapara-around? content)
  (or (itemization? content)
      (and (nested-flow? content) 
           (nested-flow-style content)
           (member (style-name (nested-flow-style content)) 
                   (list "student" "teacher" "activity")))
      ))

;; Avoid Sintraparas from being introduced by adding manual parbreaks between
;;   select items in a list.  Good for settings in which some items in list are 
;;   part of the same paragraph and others (like itemlists) introduce breaks
(define (interleave-parbreaks/select contentlist)
  (cond [(empty? contentlist) (list "\n" "\n")]
        [(cons? contentlist) 
         (cond [(suppress-intrapara-around? (first contentlist))
                (append (list "\n" "\n" (first contentlist) "\n" "\n")
                        (interleave-parbreaks/select (rest contentlist)))]
               [else (cons (first contentlist) (interleave-parbreaks/select (rest contentlist)))])]))

;; Avoid Sintraparas from being introduced by adding manual parbreaks between
;;   every pair of items in a list.  Good for settings in which items in list are
;;   never intended to be part of the same paragraph (like lesson segments)
(define (interleave-parbreaks/all contentlist)
  (cond [(empty? contentlist) (list "\n" "\n")]
        [(cons? contentlist) 
         (cons "\n" (cons "\n" (cons (first contentlist) 
                                     (interleave-parbreaks/all (rest contentlist)))))]))

(define (lesson/studteach
         #:title (title #f)
         #:duration (duration #f)
         #:overview (overview "")
         #:prerequisites (prerequisites #f)
         #:learning-objectives (learning-objectives #f)
         #:evidence-statements (evidence-statements #f)
         #:product-outcomes (product-outcomes #f)
         #:standards (standards '())
         #:materials (materials #f)
         #:preparation (preparation #f)
         #:exercises (exercise-locs '())
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
     ;(set! 'vocab-used '()) ; reset vocabulary list for each lesson
     ; next line for migration to new standards generation
     (set! 'standard-names (remove-duplicates (append standards (get 'standard-names '()))))
     (set! 'exercise-locs (append (get 'exercise-locs '()) exercise-locs))
     (set! 'bootstrap-lessons (cons (lesson-struct title
                                                   duration
                                                   anchor)
                                    (get 'bootstrap-lessons '())))     
     (nested #:style "LessonBoundary"
      (para #:style bs-page-title-style title)
      "\n" "\n"
      (nested-flow 
       bs-content-style
       (list
        ;(include-ssi)
        (nested #:style (bootstrap-sectioning-style "overview")
                (interleave-parbreaks/all
                 (list
                  (nested #:style bs-logo-style (image logo.png "bootstrap logo"))
                  ;; agenda would insert here
                  (nested #:style bs-lesson-title-style
                          (nested #:style bs-lesson-name-style "Overview"))
                  overview
                  (lesson-section "Learning Objectives" learning-objectives)
                  (lesson-section "Evidence Statements" evidence-statements)
                  (lesson-section "Product Outcomes" product-outcomes)
                  ; commented out to suppress warnings that aren't relevant with unit-level generation
                  ;(lesson-section "Standards" (expand-standards standards))
                  (lesson-section "Materials" materials)
                  (lesson-section "Preparation" preparation)
                  ;; look at unit-level glossary generation to build lesson-level glossary
                  ;(lesson-section "Glossary" (glossary get))
                  )))
        (nested #:style (bootstrap-div-style "segment")
                (interleave-parbreaks/all
                 (append
                  (list
                   (elem #:style (style #f (list (url-anchor anchor) (make-alt-tag "span"))))
                   (nested #:style bs-lesson-title-style
                           (interleave-parbreaks/all
                            (cons (para #:style bs-lesson-name-style 
                                        (interleave-parbreaks/all
                                         (list (elem title) 
                                               video-elem
                                               (cond [duration
                                                      (elem #:style bs-time-style (format "(Time ~a)" duration))]
                                                     [else (elem)]))))
                                  (list (elem)))))) ;pacings))) -- reinclude later if desired
                   body
                   ;(list (insert-toggle-buttons))
                   )))
        ))))))
  
;; contents either an itemization or a traverse block
(define (lesson-section title contents)
  (traverse-block 
   (lambda (get set)
     (let ([title-tag (string->symbol (string-downcase (string-replace title " " "-")))])
       (when (itemization? contents)
         (set title-tag (append/itemization (get title-tag '()) contents))))
     (if contents
         (nested #:style (bootstrap-div-style (string-append "Lesson" (rem-spaces title)))
          (interleave-parbreaks/all (list (bold title) contents)))
         (para)))))

;; lookup-tags: list[string] assoc[string, string] string -> element
;; looks up value associated with each string in taglist in 
;;    association list given as second arg
;;    optional arg controls whether undefined terms are displayed in output
;; used to generate standards and glossary
(define (lookup-tags taglist in-dictionary tag-descr #:show-unbound (show-unbound #f))
  (foldr (lambda (elt result)
           (let ([lookup (assoc elt in-dictionary)])
             (if lookup (cons lookup result)
                 (begin 
                   (printf "WARNING: ~a not in dictionary: ~a~n" tag-descr elt)
                   (if show-unbound (cons elt result) result)))))
         '() taglist))
    
(define (expand-standards/csv standard-tags)
  (let ([known-stnds (foldl (lambda (t res-rest)
                              (let ([descr (get-standard-descr t)])
                                (if descr
                                    (cons (list t descr) res-rest)
                                    res-rest)))
                            empty standard-tags)])
    (apply itemlist/splicing
           (for/list ([stnd known-stnds])
             (item (elem (format "~a: ~a" (first stnd) (second stnd))))))))     

(define (expand-standards standard-tags)
  (let ([known-stnds (lookup-tags standard-tags commoncore-standards-dict "Standard")])
    (apply itemlist/splicing
           (for/list ([stnd known-stnds])
             (item (elem (format "~a: ~a" (first stnd) (second stnd))))))))

(define (create-itemlist #:style [style #f] contents)
  (apply itemlist/splicing #:style style contents))

(define (create-exercise-itemlist #:ordered [ordered? #t] 
                                  #:itemstyle [itemstyle #f]
                                  contents)
  (create-itemlist #:style (if ordered? 'ordered #f)
                   (map (lambda (c) (para #:style (or itemstyle (bootstrap-div-style "ExerciseListItem")) 
                                          c))
                        contents)))

(define (create-exercise-itemlist/contract-answers #:ordered [ordered? #t] contents)
  (create-exercise-itemlist #:ordered ordered? 
                            (map (lambda (c) (list (contract-exercise "dummyid") c)) contents)))

(define (create-exercise-sols-itemlist #:ordered [ordered? #t] questions answers)
  (questions-and-answers questions answers))
;  (create-itemlist #:style (if ordered? 'ordered #f) 
;                   (map (lambda (q a) (para #:style (bootstrap-div-style "QuestionWithAnswer") 
;                                            q (bold " Answer: " a)))
;                        questions answers)))

;; format a question and answer for a solution key
(define (attach-exercise-answer question answer)
  (nested #:style (bootstrap-div-style "question-with-answer") question (bold " Answer: ") answer))  

;;;;;;;;;;;;;;;; END NEW LESSON FORMAT ;;;;;;;;;;;;;;;;;;;;;;;;

;; to add HEAD attributes, create an empty title element
(define (augment-head)
  (title #:style bs-head-style))

;; Used to generate the curriculum overview pages
;; Not sure why we have the dual nested here ...
(define (main-contents . body)
  (list (augment-head)
        (nested #:style (bootstrap-div-style/id/nested "body")
                (nested #:style (bootstrap-div-style "item") 
                        body))))

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

;; summary-item/unit-link string string content -> block
;; generates summary entry in which unit name links to html version of lesson
;;   (contrast to summary-item/links, which links to both html and pdf versions)
(define (summary-item/unit-link name basefilename . descr)
  (para #:style "BSUnitSummary"
        (elem #:style "BSUnitTitle" (elem (hyperlink (format "~a.html" basefilename) name)))
        ": "
        descr))

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
;; previously used summary-item/links (for both html/pdf links)
(define (unit-summary/links num)
  (summary-item/unit-link (format "Unit ~a" num)
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

(define (activity #:forevidence (evidence #f) . body)
  (traverse-block
   (lambda (get set!)
     ;; first, check that evidence tags on activity are valid
     (let* ([evidlist (cond [(list? evidence) evidence] [(not evidence) '()] [else (list evidence)])]
            [checked-evidlist (foldr (lambda (evidtag result-rest)
                                       (if (get-evid-statement/tag evidtag) 
                                           (cons evidtag result-rest)
                                           (begin ;(printf "WARNING: activity using invalid evidence tag ~a~n" evidtag)
                                                  result-rest)))
                                     '() evidlist)])
         (when evidence (set! 'activity-evid (append checked-evidlist (get 'activity-evid '()))))
         (nested #:style (bootstrap-div-style "activity")
                 (interleave-parbreaks/select body))))))
  

(define (review . body)
  (list "Review:"
        (compound-paragraph (bootstrap-sectioning-style "BootstrapReview")
                            (decode-flow body))))

;; language-table : list[list[elements]] -> table
;; produces table with the particular formatting for the Bootstrap language table
(define (language-table . rows)
  (nested #:style (bootstrap-div-style/id/nested "LanguageTable")    
          (table (style "thetable"
                        (list 
                         (table-columns
                          (list 
                           (style "BootstrapTable" '(center))
                           (style "BootstrapTable" '(center))))))   
                 (cons (list (para #:style "BootstrapTableHeader" "Types")
                             (para #:style "BootstrapTableHeader" "Functions"))
                       (map (lambda (r) (map para r)) rows)))))

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
  
;; generates a random binary arithmetic sexp 
;; - depth is the max depth of the expression
;; - form indicates whether to render spans for text or circle-of-evaluation
;; in future, do we need ability to generate both forms?  Seems possible -- think about that
(define (gen-random-arith-sexp #:depth (depth 2) #:form (form "sexp"))
  (when (not (member form (list "sexp" "circeval")))
    (error 'gen-random-arith-sexp "Form argument must be either sexp or circeval"))
  (let ([sexp (gen-arith-sexp depth)])
    (sexp->block sexp form)))

;; produces list with same elements as input list, but with order permuted
(define (permute-list lst)
  (let loop ([sourcelst lst])
    (if (empty? sourcelst) empty
        (let ([choose (list-ref sourcelst (random (length sourcelst)))])
          (cons choose (loop (remove choose sourcelst)))))))

;; adds copies of with-elt to alst to produce list of length to-len
;;   if alst already longer than to-len, return alst unchanged
(define (pad-to alst to-len with-elt)
  (if (>= (length alst) to-len) alst
      (let ([extras (build-list (- to-len (length alst)) (lambda (i) with-elt))])
        (append alst extras))))

;; converts a numeric list index (0-based) to a lowercase char index
(define (int-index->char-index i)
  (format "~a" (integer->char (+ i 97))))

;; produces 0-based index of element in list, defaults to eq? as comparator
(define (get-index #:compare-with [compare-with eq?] elt lst)
  (let loop [(index 0) (L lst)]
    (cond [(empty? L) (raise 'get-index-elt-not-found)]
          [(compare-with (first L) elt) index]
          [else (loop (add1 index) (rest L))])))

;; gets the lowercase letter label of an answer from a list of answers
;;  intended to compute original label of answer in a matching problem
(define (matching-label #:compare-with [compare-with eq?] ans presented-order)
  (int-index->char-index (get-index #:compare-with compare-with ans presented-order)))

;; annotates each answer in a matching exercise with the label of the
;;   answer in the presented problem
(define (matching-exercise-answers #:compare-with [compare-with eq?] 
                                   #:content-of-ans [content-of-ans #f]
                                   #:some-no-match? [some-no-match? #f]
                                   ques formatted-ans presented-ans)
  (let ([annotated-ans 
         (map (lambda (ansF ansC)
                (with-handlers ([(lambda (e) (eq? e 'get-index-elt-not-found))
                                 (lambda (e)
                                   (if some-no-match?
                                       (elem #:style "matchLabelAns" "No matching answer")
                                       (raise 'matching-exercise-answers (format "No match for ~a" ansC))))])
                  (let ([label (matching-label #:compare-with compare-with
                                               ansC presented-ans)])
                    (nested #:style (bootstrap-div-style "labeledRightColumn")
                            (interleave-parbreaks/all
                             (list (para #:style (bootstrap-span-style "rightColumnLabel") label)
                                   ansF))))))
              formatted-ans (or content-of-ans formatted-ans))])
    (two-col-layout #:layoutstyle "solutions matching" ques annotated-ans)))

;; given two lists of content, produces an exercise to match each item in
;;   colA with one from colB.  If permute is true, then contents of colB
;;   are permuted before generating the output.
;; Pads lists as needed to balance length (allows some matches to not be used)
;; real-matching? distinguishes actual matching exercises that need labels on
;;   the right column from cases that use this to generate twoColumnLayouts (like answer blanks)
(define (matching-exercise #:permute [permute #f] 
                           colA colB)
  (let* ([permutedB (if permute (permute-list colB) colB)]
         [paddedcolA (if (> (length colB) (length colA)) (pad-to colA (length colB) "") colA)]
         [paddedcolB (if (> (length colA) (length colB)) (pad-to permutedB (length colA) "") permutedB)])
    (two-col-layout #:layoutstyle "matching"
                    paddedcolA paddedcolB)))

;; generic function for creating a two-column layout.  Not meant to be called
;; directly from .scrbl files.  Mostly used for exercise generation
(define (two-col-layout #:leftcolextratag [leftcolextratag ""]
                        #:rightcolextratag [rightcolextratag ""]
                        #:layoutstyle [layoutstyle ""]
                        colA colB)
  (two-or-three-col-layout #:leftcolextratag leftcolextratag
                           #:rightcolextratag rightcolextratag
                           #:layoutstyle layoutstyle
                           #:include-center? #f
                           colA colB '()))
;  (let* ([paddedcolA (if (> (length colB) (length colA)) (pad-to colA (length colB) "") colA)]
;         [paddedcolB (if (> (length colA) (length colB)) (pad-to colB (length colA) "") colB)]
;         [leftcolstyle (bootstrap-div-style (string-append "leftColumn" " " leftcolextratag))]
;         [rightcolstyle (bootstrap-div-style (string-append "rightColumn" " " rightcolextratag))])       
;    (create-itemlist #:style (string-append "twoColumnLayout " layoutstyle)
;                     (map (lambda (left right)
;                            (interleave-parbreaks/all
;                             (list 
;                              (nested #:style leftcolstyle left)
;                              (nested #:style rightcolstyle right))))
;                          paddedcolA paddedcolB))))

;; generic function for creating a three-column layout.  Not meant to be called
;; directly from .scrbl files.  Mostly used for exercise generation
(define (two-or-three-col-layout #:leftcolextratag [leftcolextratag ""]
                                 #:centercolextratag [centercolextratag ""]
                                 #:rightcolextratag [rightcolextratag ""]
                                 #:include-center? [include-center? #t]
                                 #:layoutstyle [layoutstyle ""]
                                 colA colB colC)
  (let* ([maxcollength (max (length colA) (length colB) (length colC))]
         [paddedcolA (pad-to colA maxcollength "")]
         [paddedcolB (pad-to colB maxcollength "")]
         [paddedcolC (pad-to colC maxcollength "")]
         [leftcolstyle (bootstrap-div-style (string-append "leftColumn" " " leftcolextratag))]
         [centercolstyle (bootstrap-div-style (string-append "centerColumn" " " centercolextratag))]
         [rightcolstyle (bootstrap-div-style (string-append "rightColumn" " " rightcolextratag))])
    (create-itemlist #:style (string-append "twoColumnLayout " layoutstyle)
                     (if include-center?
                         (map (lambda (left center right)
                                (interleave-parbreaks/all
                                 (list 
                                  (nested #:style leftcolstyle left)
                                  (nested #:style centercolstyle center)
                                  (nested #:style rightcolstyle right))))
                              paddedcolA paddedcolB paddedcolC)
                         (map (lambda (left right)
                                (interleave-parbreaks/all
                                 (list 
                                  (nested #:style leftcolstyle left)
                                  (nested #:style rightcolstyle right))))
                              paddedcolA paddedcolB)))))

(define three-col-exercise two-or-three-col-layout)
(define three-col-answers two-or-three-col-layout)

;; generate a two-column layout with no special formatting towards item labeling
(define (completion-exercise colA colB)
  (two-col-layout colA colB))

(define questions-and-answers two-col-layout)

;; generates a two-column layout with blanks for the answers in the right column
;;   answer-type argument used to control the amount of space left for answers
;; two-col-layout will pad the given empty list to match the length of colA
(define (open-response-exercise colA answer-type)
  (unless (member answer-type '("circeval" "code" "math" "text"))
    (error 'open-response-exercise (format "Unexpected answer type ~a~n" answer-type)))
  (two-col-layout #:rightcolextratag (string-append "studentAnswer " answer-type)
                  colA '()))
                     
;; given answer key for matching exercise, generate solutions
(define (matching-exercise-sols matches)
  (matching-exercise (map (lambda (m) (attach-exercise-answer (first m) (second m))) matches)
                     '()))

;; creates an elem containing string with index number before each elt in list
(define (add-index-nums/elem elts)
  (map (lambda (e index) (elem (format "~a." index) e))
       elts (build-list (length elts) (lambda (i) (add1 i)))))

;; generates a table with questions in the left column and blank lines in the right
(define (fill-in-blank-answers-exercise questions #:numbered? (numbered? #t))
  (let* ([numberedques (if numbered? (add-index-nums/elem questions) questions)]
         [rowslist (map (lambda (ques) 
                          (list ques (fill-in-the-blank #:class "studentAnswer")))
                        numberedques)])
    (tabular #:style "matching-table" rowslist)))

;; Given a list of sexps as strings, create a matching exercise between
;;   the expressions and circle-of-eval forms.  Can optionally take the
;;   list of permuted sexpstrs as a second argument (if don't want
;;   the permutation done automatically).  
(define (circeval-matching-exercise/code sexplst . permutedstrs)
  (let ([textlst (map (lambda (str) (sexp str #:form "code")) sexplst)])
    (if (empty? permutedstrs)
        (matching-exercise 
         #:permute #t
         textlst
         (map (lambda (str) (sexp str #:form "circofeval")) sexplst))
        (matching-exercise
         textlst
         (map (lambda (str) (sexp str #:form "circofeval")) (first permutedstrs))))))
       
(define (circeval-matching-exercise/math mathexps sexps #:permute (permute #f))
  (matching-exercise #:permute permute 
                     mathexps 
                     (map (lambda (str) (sexp str #:form "circofeval")) sexps)))
  
;; tostring for sexps, useful in exercise generation
;;   wrap indicates whether to wrap result in parens
;;   special handling for / so that it renders as a fraction
(define (sexp->arith-str sexp #:wrap [wrap #f])
  (cond [(number? sexp) (format "~a" sexp)]
        [else 
         (cond [(eq? (first sexp) '/) (format "{~a\\over~a}" 
                                              (sexp->arith-str (second sexp))
                                              (sexp->arith-str (third sexp)))]
               [else
                (let ([base (format "~a ~a ~a" 
                                    (sexp->arith-str (second sexp) #:wrap #t) 
                                    (first sexp) 
                                    (sexp->arith-str (third sexp) #:wrap #t))])
                  (if wrap (format "(~a)" base) base))])]))
                          
(define (sexp->math sexp #:wrap [wrap #f])
  (math (sexp->arith-str sexp #:wrap wrap)))

(define (sexp->coe e)
  (sexp #:form "circofeval" e))

(define (sexp->code e)
  (sexp #:form "code" e))

;;;;;;;;; API for Design Receipe Exercises ;;;;;;;;;;;;;;;;;;;;;

(define htmlRarr (cond-element [html (sxml->element 'rarr)] [else "->"]))

;; Create a design-recipe exercise
;;   funname: string naming the function
;;   directions: instructions for the problem 
(define (design-recipe-exercise funname directions
                                #:domain-list (domain-list '())
                                #:show-domains (show-domains '())
                                #:range (range #f)
                                #:show-range? (show-range? #f)
                                #:purpose (purpose #f)
                                #:show-purpose? (show-purpose? #f)
                                #:example-list (example-list '())
                                #:show-examples (show-examples '())
                                #:param-list (param-list '())
                                #:show-params (show-params '())
                                #:body (body #f)
                                #:show-body? (show-body? #f)
                                )
  (nested #:style (bootstrap-div-style/extra-id "segment" "exercises")
          (interleave-parbreaks/all
           (list
            (para #:style (bootstrap-div-style "exercise-instr")
                  (bold "Directions:") (string-append " " directions))
            (nested #:style (bootstrap-div-style "designRecipeLayout")
                    (interleave-parbreaks/all
                     (list
                      (design-recipe-section "recipe_contract" 
                                             "Contract and Purpose Statement"
                                             "Every contract has three parts ..."
                                             (make-spacer ";")
                                             (make-wrapper
                                              (dr-student-answer #:id? #f "recipe_name" funname)
                                              (para #:style (bootstrap-span-style "") ":")
                                              (dr-student-answer "recipe_domain" domain-list)
                                              (para #:style (bootstrap-span-style "") htmlRarr)
                                              (dr-student-answer "recipe_range" range))
                                             (make-clear)
                                             (make-spacer ";")
                                             (make-wrapper
                                              (dr-student-answer "recipe_purpose" purpose)))
                      ;; need one of these for each example provided/expected
                      (design-recipe-section "recipe_examples"
                                             "Examples"
                                             "Write some examples of your function in action..."
                                             (make-spacer "(EXAMPLE ")
                                             (make-spacer "(")
                                             (make-wrapper
                                              (dr-student-answer #:id? #f "recipe_name" funname)
                                              (dr-student-answer #:id? #f "recipe_example_inputs" "")
                                              (make-spacer ")")
                                              ;(make-clear) ; only force this for long-form DR (maybe via a flag?)
                                              (dr-student-answer #:id? #f "recipe_example_body" "")
                                              (make-spacer ")")))
                      (design-recipe-section "recipe_definition"
                                             "Definition"
                                             "Write the definition, giving variable names to all your input values..."
                                             (make-spacer "(define ")
                                             (make-spacer "(")
                                             (make-wrapper
                                              (dr-student-answer #:id? #f "recipe_name" funname)
                                              (dr-student-answer "recipe_variables" param-list)
                                              (make-spacer ")")
                                              ;(make-clear)  ; only force this for long-form DR (maybe via a flag?)
                                              (dr-student-answer "recipe_definition_body" body)
                                              (make-spacer ")")))
                      )))))))

(define (design-recipe-section id title instructions . body)
  (nested #:style (bootstrap-div-style/id/nested id)
          (interleave-parbreaks/all
           (append (list (para #:style (bootstrap-div-style "sectionTitle") title)
                         (para #:style (bootstrap-div-style "sectionInstructions") instructions))
                   body))))      

(define (make-wrapper . contents)
  (nested #:style (bootstrap-div-style "wrapper")
          (interleave-parbreaks/all contents)))

(define (make-spacer contents)
  (para #:style (bootstrap-span-style "spacer") contents))

(define (make-clear)
  (para #:style (bootstrap-span-style "clear") ""))
  
(define (dr-student-answer class-or-id answer #:id? (id? #t) #:show? (show? #f))
  (let ([style (if id? 
                   (bootstrap-span-style/extra-id "studentAnswer" class-or-id) 
                   (bootstrap-span-style (string-append "studentAnswer " class-or-id)))])
    (para #:style style
          (if (string? answer) 
              (make-string (string-length answer) #\M)
              " "))))

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

(define (evidence-statements . items)
  (list (compound-paragraph bs-header-style 
                            (decode-flow (list "Evidence Statements:")))
        (apply itemlist/splicing items #:style "BootstrapEvidenceStatementsList")))

(define (product-outcomes . items)
;  (list (para #:style bs-header-style "Product Outcomes:")
;        (apply itemlist/splicing items #:style "BootstrapProductOutcomesList")))
  (list (compound-paragraph bs-header-style 
                            (decode-flow (list "Product Outcomes:")))
        (apply itemlist/splicing items #:style "BootstrapProductOutcomesList")))

;; assumes no duplicates in the stdtaglist
;; do we want to suppress evidence for non-teachers, or will formatting effectively handle that?
;; NOTE: this function reflects an API weakness relative to standards-csv-api: the map in 
;;   tag-formatted-LOtree really shouldn't be looking into the first/second/third of lists or at indices
(define (learn-evid-from-standards)
  (traverse-block
   (lambda (get set)
     (lambda (get set)
       (let* ([evid-used (get 'activity-evid '())]
              [stdtaglist (get 'standard-names '())]
              [LOtree (apply append (map get-learnobj-tree stdtaglist))]
              [tag-formatted-LOtree
               (map (lambda (lo)
                      (let* ([usedevid (sort (get-used-evidnums/std (third lo) evid-used) <=)]
                             [keep-evid (map (lambda (keep-index) (list-ref (second lo) (sub1 keep-index))) usedevid)])
                        (when (empty? keep-evid)
                          (printf "WARNING: Unit has no activities for evidence statments under listed standard ~a~n" (third lo)))
                        (list (elem (bold (third lo)) ": " (first lo))
                              keep-evid)))
                    ;; separately alphabetize Common Core and BS standards
                    (let loop [(Allobjs LOtree) (BSobjs empty) (Others empty)]
                      (cond [(empty? Allobjs) 
                             (append (sort Others (lambda (o1 o2) (string<=? (third o1) (third o2))))
                                     (sort BSobjs (lambda (o1 o2) (string<=? (third o1) (third o2)))))]
                            [(string=? "BS-" (substring (third (first Allobjs)) 0 3))
                             (loop (rest Allobjs) (cons (first Allobjs) BSobjs) Others)]
                            [else (loop (rest Allobjs) BSobjs (cons (first Allobjs) Others))])))])
         ;(printf "Have activity tags ~a~n" (get 'activity-evid '()))
         ;(for-each (lambda (std) (printf "Std ~a uses nums ~a ~n" std (get-used-evidnums/std std evid-used))) stdtaglist)
         ;(printf "~n")
         (nested #:style (bootstrap-div-style/id/nested "LearningObjectives")
                 (interleave-parbreaks/all
                  (list
                   (para #:style bs-header-style/span "Standards and Evidence Statements:")
                   (list "Standards with"
                         " prefix BS are specific to Bootstrap; others are from the Common Core."
                         " Mouse over each standard to see its corresponding evidence statements."
                         " Our " 
                         (hyperlink "../../../../Standards.shtml" "Standards Document") 
                         " shows which units cover each standard. "
                         )
                   (list->itemization tag-formatted-LOtree 
                                      (list "LearningObjectivesList" "EvidenceStatementsList"))))))))))

;; used to pull summary data generated over an entire unit or lesson from the
;; traverse table
;; TODO: Weed out duplicates in the list
(define (summary-data/auto tag header . pre-content)
  (traverse-block
   (lambda (get set)
     (lambda (get set)
       (let ([items (get tag (itemlist))])
         (nested #:style (bootstrap-div-style/id/nested (rem-spaces header))
          (interleave-parbreaks/all
           (list
            (para #:style bs-header-style/span (format "~a:" header))
            (if (empty? pre-content) "" (first pre-content))
            (remdups/itemization items)))))))))

;; strips all spaces from a string
(define (rem-spaces str)
  (string-replace str " " ""))

;; determine whether "s" is last character of given string
(define (ends-in-s? str)
  (char=? #\s (string-ref str (sub1 (string-length str)))))

;; produces string with last character of given string removed
(define (rem-last-char str)
  (substring str 0 (sub1 (string-length str))))

;; replace words in strlist with singular versions that appear in dictionary
(define (singularize-vocab-terms strlist)
  (map (lambda (str) 
         (if (and (ends-in-s? str)
                  (assoc (rem-last-char str) glossary-terms-dictionary))
             (rem-last-char str)
             str))
       strlist))

;; glossary-entry : string (string or #f) -> elem
;; generates markup for glossary entry; defn may be missing
(define (glossary-entry term defn)
  (let ([term-elem (elem #:style (bootstrap-span-style "vocab") term)])
    (if defn
        (elem term-elem ": " defn)
        term-elem)))

;; retrieves vocab terms used in document and generates block containing
;;   terms and their definitions from the dictionary file
(define (gen-glossary)
  (traverse-block
   (lambda (get set)
     (lambda (get set)
       (let* ([clean-terms (sort (remove-duplicates (singularize-vocab-terms (map string-downcase (get 'vocab-used '()))))
                                 string<=?)]
              [terms (lookup-tags clean-terms
                                  glossary-terms-dictionary "Vocabulary term" #:show-unbound #t)])
         (if (empty? terms) (para)
             (nested #:style (bootstrap-div-style/id/nested "Glossary")
                     (interleave-parbreaks/all
                      (list
                       (para #:style bs-header-style/span "Glossary:")
                       (apply itemlist/splicing
                              (for/list ([term terms])
                                (cond [(and (list? term) (string=? "" (second term)))
                                       (begin
                                         (printf "WARNING: Vocabulary term has empty definition in dictionary: ~a ~n" (first term))
                                         (glossary-entry (first term) #f))]
                                      [(list? term)
                                       (glossary-entry (first term) (second term))]
                                      [else (glossary-entry term #f)]))))))))))))

;; produces values for the title and forevidence arguments for given exercise locator
;;  either or both values will be false if not found in the file
(define (extract-exercise-data exloc)
  (let ([filepath (build-path lessons-dir (exercise-locator-lesson exloc) 
                              "exercises" (string-append (exercise-locator-filename exloc) ".scrbl"))]
        )
    (let ([data
           (with-input-from-file filepath
             (lambda ()
               (with-handlers ([(lambda (e) (eq? e 'local-break))
                                (lambda (e) (list #f #f))])
                 ;; check that file starts with a #lang
                 (let ([init-line (read-line)])
                   (unless (and (string? init-line) (string=? "#lang" (substring init-line 0 5)))
                     (printf (format "WARNING: extract-exercise-data: ~a does not start with #lang~n" filepath))
                     (raise 'local-break)))
                 ;; loop until get to the exercise sexp
                 (let ([exercise-sexp
                        (let loop ()
                          (let ([next (read)])
                            (cond [(eof-object? next) 
                                   (begin
                                     (printf "WARNING: extract-exercise-data reached end of file without finding exercise-handout~n")
                                     (raise 'local-break))]
                                  [(eq? next '@)
                                   (let ([next-sexp (read)])
                                     (if (and (cons? next-sexp) (equal? (first next-sexp) 'exercise-handout))
                                         next-sexp
                                         (loop)))]
                                  [else
                                   (begin
                                     (printf (format "WARNING: extract-exercise-data: got non-@ term ~a~n" next))
                                     (raise 'local-break))])))])
                   ;; dig into the exercise sexp to find the title and evidence tag
                   (let loop [(title #f) (evtag #f) (rem-sexp (rest exercise-sexp))]
                     (cond [(< (length rem-sexp) 2) (list title evtag)]
                           [(equal? (first rem-sexp) '#:title) (loop (second rem-sexp) evtag (rest (rest rem-sexp)))]
                           [(equal? (first rem-sexp) '#:forevidence) (loop title (second rem-sexp) (rest (rest rem-sexp)))]
                           [else (loop title evtag (rest (rest rem-sexp)))]))))))])
      ;(printf "extract-data got ~a ~n" data)
      (values (first data) (second data)))))
                                     
(define (gen-exercises)
  (traverse-block
   (lambda (get set)
     (lambda (get set)
       (let ([exercise-locs (get 'exercise-locs '())])
         (if (empty? exercise-locs) (para)
             (nested #:style (bootstrap-div-style "ExtraExercises")
                     (interleave-parbreaks/all
                      (list 
                       (para #:style bs-lesson-title-style "Additional Exercises:")
                       (apply itemlist/splicing 
                              (map (lambda (exloc)
                                     (let-values ([(extitle exforevid) (extract-exercise-data exloc)])
                                       (let ([descr (if extitle extitle (exercise-locator-filename exloc))]
                                             [support (if exforevid
                                                          (let ([evidstmt (get-evid-summary exforevid)])
                                                            (if evidstmt (format " [supports ~a]" evidstmt)
                                                                ""))
                                                          "")])
                                         (let ([exdirpath (if (current-deployment-dir)
                                                              (build-path (current-deployment-dir) "lessons") 
                                                              (build-path lessons-dir))])
                                           (elem (list (hyperlink (build-path exdirpath
                                                                              (exercise-locator-lesson exloc) "exercises"
                                                                              (string-append (exercise-locator-filename exloc) ".html"))
                                                                  descr)
                                                       ; uncomment next line when ready to bring evidence back in
                                                       ;(elem #:style (bootstrap-span-style "supports-evid") support)
                                                       ))))))
                                   exercise-locs))
                       )))))))))
  
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
      
       ;; compute total unit length to include in the unit overview
       (let ([unit-minutes (foldr (lambda (elt result)
                                    (let ([mins (string->number (extract-minutes elt))])
                                      (+ (if mins mins 0) result)))
                                  0 lessons)])
         ;(printf "Computed ~a minutes~n" unit-minutes)
         (set 'unit-length unit-minutes))
         
       (nested #:style bootstrap-agenda-style 
               (interleave-parbreaks/all
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
                                     (lesson-struct-anchor a-lesson)))))))))))))




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
  
  ;; using rest in next line to eliminate an otherwise empty <p> block 
  ;;   that was getting inserted into each lesson
  (interleave-parbreaks/all (rest (part-blocks a-doc))))


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
(define (design-recipe-exercise-old func-name . description)
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

;; STILL IN USE???
(define (overview #:gen-agenda? (gen-agenda? #t) . body)
  (nested #:style "OverviewBoundary"
   (elem #:style (bootstrap-style "BootstrapOverviewTitle") "Unit Overview")
   (if gen-agenda? (agenda) (elem))
   (nested #:style (bootstrap-sectioning-style "BootstrapOverview") 
           (list body)) 
   ))

(define (insert-help-button)
  (para #:style (make-style #f (list (make-alt-tag "iframe") 
                                     (make-attributes (list (cons 'id "forum_embed"))))) 
        ""))
                                     
;; DEPRECATED!!!!
(declare-tags pedagogy)

(define (unit-lessons . body)
  (interleave-parbreaks/all (append body (list (gen-exercises) (copyright)))))

(define (unit-overview/auto 
         #:objectives (objectivesItems #f)
         #:evidence-statments (evidenceItems #f)
         #:product-outcomes (product-outcomesItems #f)
         #:standards (standards #f)
         #:length (length #f)
         #:materials (materialsItems #f)
         #:preparation (preparationItems #f)
         #:lang-table (lang-table #f)
         #:gen-agenda? (gen-agenda? #t) 
         . description
         )
  (interleave-parbreaks/all
   (list (nested #:style (bootstrap-div-style/id "overviewDescr") 
               (interleave-parbreaks/all
                (list (para #:style bs-header-style/span "Unit Overview")
                      description                      
                      )))
         (nested #:style "OverviewBoundary"
                 (interleave-parbreaks/all
                  (list
                   (insert-help-button)
                   (nested #:style (bootstrap-sectioning-style "summary") 
                           (interleave-parbreaks/all
                            (list
                             (if gen-agenda? (agenda) "")
                             ; moved these outside summary for code.org prep -- remove next two lines once E confirms
                             ;(para #:style bs-header-style/span "Unit Overview")
                             ;(para #:style (bootstrap-div-style/id "overviewDescr") description)
                             (if product-outcomesItems (product-outcomes product-outcomesItems) 
                                 (summary-data/auto 'product-outcomes "Product Outcomes"))
                             (learn-evid-from-standards)
                             (if length (length-of-lesson length) (length-of-unit/auto))
                             (gen-glossary)
                             (if (audience-in? (list "teacher" "volunteer"))
                                 (if materialsItems (materials materialsItems) 
                                     (summary-data/auto 'materials "Materials"))
                                 (elem))
                             (if (audience-in? (list "teacher" "volunteer"))
                                 (if preparationItems (preparation preparationItems) 
                                     (summary-data/auto 'preparation "Preparation"))
                                 (elem))
                             (if lang-table 
                                 (if (list? (first lang-table))
                                     (apply language-table lang-table)
                                     (language-table lang-table))
                                 "")
                             (insert-toolbar)
                             )))))
                 ))
   ))

;; info required to locate an exercise within the filesystem
;;   will be used to generate links
(define-struct exercise-locator (lesson filename))

;; breaks a string into a list of content, in which substrings in
;;  the given list have been italicized
(define (italicize-within-string str terms-to-ital)
  (format-key-terms str terms-to-ital italic))

(define exercise-terms-to-italicize 
  (list "Circle of Evaluation" 
        "Arithmetic Expression" 
        "arithmetic expression"
        "Expression"
        "Example"
        "Contract" 
        "code"))

(define (exercise-handout #:title [title #f]
                          #:instr [instr #f]
                          #:forevidence [forevidence #f]
                          . body)
  ;(printf "processing handout~n")
  ;(printf "evidence is ~a~n" forevidence)
  ;(printf "body has length ~a~n~n" (length body))
  (let ([full-title (if title (string-append "Exercise: " title) "Exercise")])
    (interleave-parbreaks/all
     (list (head-title-no-content full-title)
           (elem #:style bs-title-style full-title)
           (nested #:style bs-content-style
                   (nested #:style bs-handout-style
                           (interleave-parbreaks/all
                            (cons (para #:style bs-exercise-instr-style (bold "Directions: ") 
                                        (italicize-within-string instr exercise-terms-to-italicize))
                                  body))))
           (copyright)))))

;(define (exercise-handout/solutions #:title [title #f]
;                                    #:instr [instr #f]
;                                    #:forevidence [forevidence #f]
;                                    . body)
;  (let ([full-title (if title (string-append "Solutions to " title) "Solutions")])
;    (interleave-parbreaks/all
;     (list (head-title-no-content full-title)
;           (elem #:style bs-title-style full-title)
;           (nested #:style bs-content-style
;                   (nested #:style bs-handout-style
;                           (interleave-parbreaks/all
;                            (cons (para #:style bs-exercise-instr-style (bold "Directions: ") 
;                                        (italicize-within-string instr exercise-terms-to-italicize))
;                                  body))))
;           (copyright)))))

;; exercise-answers merely tags content.  The module reader will leave answers
;; in or remove them based on the solutions generation mode
(define (exercise-answers . body)
  body)

(define exercise-evid-tags list)
  
;; determine whether we are currently in solutions-generation mode
;; need two versions of this: one for syntax phase and one for runtime
(define (solutions-mode-on?)
  (let ([env (getenv "CURRENT-SOLUTIONS-MODE")])
    ;(printf "Solutions mode is ~a ~n" env)
    (and env (string=? env "on"))))
;(define-for-syntax (solutions-mode-on?/syntax) 
;  (let ([env (getenv "CURRENT-SOLUTIONS-MODE")])
;    (and env (string=? env "on"))))
  
  
;; Inputs: string [string] [string] [string] -> element
;;         optional argument supply answers for the workbook
;; Produces element with blanks for an exercise to fill in a contract
(define (contract-exercise tag #:name [name-ans #f] #:domain [domain-ans #f] #:range [range-ans #f])
  (cond-element [html
                 (elem "; " (fill-in-the-blank #:id (format "~aname" tag) #:label "Name" #:class "contract-name studentAnswer")
                       " : " (fill-in-the-blank #:id (format "~aarg" tag) #:label "Domain" #:class "contract-domain studentAnswer")
                       " -> " (fill-in-the-blank #:id (format "~aoutput" tag) #:label "Range" #:class "contract-range studentAnswer"))]
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
  (para #:style (bootstrap-div-style/id "copyright")
   (hyperlink "http://creativecommons.org/licenses/by-nc-nd/3.0/" creativeCommonsLogo) "Bootstrap by " (hyperlink "http://www.bootstrapworld.org/" "Emmanuel Schanzer") " is licensed under a "
   (hyperlink "http://creativecommons.org/licenses/by-nc-nd/3.0/" "Creative Commons 3.0 Unported License")
   ". Based on a work at " (hyperlink "http://www.bootstrapworld.org/" "www.BootstrapWorld.org")
   ". Permissions beyond the scope of this license may be available at "
   (hyperlink "mailto:schanzer@BootstrapWorld.org" "schanzer@BootstrapWorld.org") "."))

;; ONLY USED IN BS2 UNITS FOLLOWING OLD FORMAT
;; remove this as soon as bs2 units convert to the bs1-style lesson headers
;autogenerates state-standards section
(define state-standards
  (list (para #:style bs-header-style "State Standards")
        "See our " 
        (hyperlink "../../../../Standards.shtml" "Standards Document") 
        " provided as part of the Bootstrap curriculum."))

;creates the length of the lesson based on input
;input ONLY THE NUMBER!
(define (length-of-lesson l)
  (para #:style bs-header-style/span (format "Length: ~a minutes" l)))

(define (length-of-unit/auto)
  (traverse-block
   (lambda (get set)
     (lambda (get set)
       (length-of-lesson (get 'unit-length "No value found for"))))))

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
(define (worksheet-link #:name (name #f)
                        #:page (page #f)
                        #:lesson (lesson #f)
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
                   "Page " (number->string (cond [page page] 
                                                 [name (get-workbook-page/name name)] 
                                                 [else (begin (printf "WARNING: worksheet link needs one of page or name~n") 0)])))))

;; used to generate title in head without scribble-generated title content
(define (head-title-no-content text)
  (title #:style 'hidden text))

;; generates the title, which includes the bootstrap logo in html but not in latex/pdf
(define (bootstrap-title #:single-line [single-line #f] . body)
  (define the-title (apply string-append body))
  (define unit+title (if single-line #f (regexp-match #px"^([^:]+):\\s*(.+)$" the-title))) 
  (define bootstrap-image (cond-element 
                           [html bootstrap.gif]
                           [(or latex pdf) (elem)]))
  (interleave-parbreaks/all
   (cond 
     [unit+title (list (head-title-no-content the-title)                                           
                       (nested #:style (bootstrap-div-style "headercontent")
                               (list (para #:style (bootstrap-span-style "BootstrapTitle")
                                           bootstrap-image
                                           (elem #:style (bootstrap-span-style "TitleUnitNum") (second unit+title)) 
                                           (third unit+title)
                                           ;(length-of-unit/auto)
                                           ))))]
     [else (list (head-title-no-content the-title)
                 (nested #:style (bootstrap-div-style "headercontent") 
                         (list (para #:style (bootstrap-span-style "BootstrapTitle") 
                                     (cons bootstrap-image body)))))])))

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
