#lang racket/base

(require racket/runtime-path
         ;(except-in racket/contract contract-exercise)
         racket/string
         scribble/base
         scribble/core
         scribble/decode
         scribble/basic
         scribble/html-properties
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
         "sxml.rkt"
         "paths.rkt"
         "scribble-helpers.rkt"
         "standards-csv-api.rkt"
         "standards-dictionary.rkt"
         "glossary-terms.rkt"
         "auto-format-within-strings.rkt"
         "workbook-index-api.rkt"
         "styles.rkt"
         "process-code.rkt"
         "design-recipe-generator.rkt"
         "exercise-generator.rkt"
	 "math-rendering.rkt"
         "wescheme.rkt"
         )
 
;; FIXME: must add contracts!
(provide vocab
         code
         math
         bannerline
         boxed-text
         new-paragraph
         animated-gif
         language-table
         build-table/cols
         design-recipe-exercise
         assess-design-recipe
         unit-summary/links
         summary-item/links
         summary-item/custom
         summary-item/unit-link
         summary-item/no-link
         matching-exercise
         matching-exercise-answers
         completion-exercise
         open-response-exercise
         questions-and-answers
         circeval-matching-exercise/code
         circeval-matching-exercise/math
         fill-in-blank-answers-exercise
         sexp
         sexp->math
	 sexp->coe
	 sexp->code
         make-exercise-locator
         make-exercise-locator/dr-assess
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
         resource-link
         video-link
         [rename-out [worksheet-link/src-path worksheet-link]] 
         lulu-button
         embedded-wescheme
                
         ;; lesson formatting 
         lesson
         lesson/studteach
         pacing
         points
         point
         student
         teacher
         itemlist/splicing ;; need because bs1 teachers-guide.scrbl using it (still in old lesson format)
         activity
         csp-activity
         unit-descr
         main-contents
         
         ;; Unit sections
         exercises
         materials
         objectives
         product-outcomes
         preparation
         agenda
         copyright
         
         ;; Include lesson/lesson link
         include-lesson
         lesson-link

         ;; Unit summaries
         unit-length
         unit-overview/auto
         unit-lessons
         length-of-lesson
         bootstrap-title
         augment-head
         
         ;; styles directly referenced in files
         bs-coursename-style
                  
         )        

;;;;;;;;;;;; Runtime paths and settings ;;;;;;;;;;;;;;;;;;;;;;;

(define-runtime-path worksheet-lesson-root (build-path 'up "lessons"))
(define-runtime-path logo.png "logo.png")

;; determine whether we are currently in solutions-generation mode
;; need two versions of this: one for syntax phase and one for runtime
(define (solutions-mode-on?)
  (let ([env (getenv "CURRENT-SOLUTIONS-MODE")])
    ;(printf "Solutions mode is ~a ~n" env)
    (and env (string=? env "on")))) 

;;;;;;;;;;;;;;;; Site Images ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(define bootstrap.gif (bitmap "bootstrap.gif"))
(define bootstrap.logo (bitmap "logo-icon.png"))
(define creativeCommonsLogo (bitmap "creativeCommonsLogo.png"))

;;;;;;;;;;;;;;;; Styles ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define bs-header-style (bootstrap-paragraph-style "BootstrapHeader"))
(define bs-header-style/span (bootstrap-span-style "BootstrapHeader"))
(define bs-lesson-title-style (bootstrap-style "BootstrapLessonTitle"))
(define bs-lesson-name-style (bootstrap-style "BSLessonName"))
(define bs-lesson-duration-style (bootstrap-style "BSLessonDuration"))
(define bs-video-style (bootstrap-style "BootstrapVideo"))
(define bs-page-title-style (bootstrap-style "BootstrapPageTitle"))

(define bs-time-style (bootstrap-span-style "time"))
(define bs-callout-style (bootstrap-div-style "callout"))
(define bs-student-style (bootstrap-div-style "student"))
(define bs-teacher-style (bootstrap-div-style "teacher"))
(define bs-logo-style (bootstrap-span-style "BootstrapLogo"))
(define bs-vocab-style (bootstrap-span-style "vocab"))
(define bs-banner-style (bootstrap-div-style "banner"))
(define bs-boxtext-style (bootstrap-div-style "boxedtext"))

(define bs-head-style (make-style #f (list bs-head-additions)))
(define bs-handout-style (bootstrap-div-style/extra-id "segment" "exercises"))
(define bs-exercise-instr-style (bootstrap-div-style "exercise-instr"))

;;;;;;;;;;;;; Basic formatting ;;;;;;;;;;;;;;;;;;;

;; accumulate all vocab referenced in lesson so we can generate a glossary
(define (vocab body)
  (traverse-element
   (lambda (get set)
     (set 'vocab-used (cons body (get 'vocab-used '())))
     (elem #:style bs-vocab-style body))))

;; generate content to be styled as its own line in a block
(define (bannerline  . body)
  (elem #:style bs-banner-style body))

;; generate content to be styled in a framed box
(define (boxed-text  . body)
  (elem #:style bs-boxtext-style body))

;; add a paragraph break by inserting two linebreaks
(define (new-paragraph)
  (list (linebreak) (linebreak)))

;; insert animated gif into file
(define (animated-gif path-as-str)
  (let ([path-strs (string-split path-as-str "\\")])
    (image (apply build-path path-strs))))

;;;;;;;;;;;;;; Lesson structuring ;;;;;;;;;;;;;;;;;;;;;;;

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

;auto generates copyright section
(define (copyright . body)
  (para #:style (bootstrap-div-style/id "copyright")
   (hyperlink #:style bootstrap-hyperlink-style "http://creativecommons.org/licenses/by-nc-nd/4.0/" creativeCommonsLogo) "Bootstrap by " (hyperlink "mailto:schanzer@bootstrapworld.org" "Emmanuel Schanzer") " is licensed under a "
   (hyperlink #:style bootstrap-hyperlink-style "http://creativecommons.org/licenses/by-nc-nd/4.0/" "Creative Commons 4.0 Unported License")
   ". Based on a work at " (hyperlink "http://www.bootstrapworld.org/" "www.BootstrapWorld.org")
   ". Permissions beyond the scope of this license may be available at "
   (hyperlink "mailto:schanzer@BootstrapWorld.org" "schanzer@BootstrapWorld.org") "."))

;; activities that are interspersed into the notes
;; the style-tag argument is the html tag (string) for the div
(define (styled-activity #:forevidence (evidence #f) 
                         #:answer (answer #f)
                         #:show-answer? (show-answer? #f)
                         style-tag
                         . body)
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
         (nested #:style (bootstrap-div-style style-tag)
                 (interleave-parbreaks/select body))))))

;; activities that are interspersed into the notes, tagged as a generic activity
(define (activity #:forevidence (evidence #f) 
                  #:answer (answer #f)
                  #:show-answer? (show-answer? #f)
                  . body)
  (apply styled-activity #:forevidence evidence
                         #:answer answer
                         #:show-answer? show-answer?
                         "activity"
                         body))

;; activities that are interspersed into the notes, tagged as part of CS principles
(define (csp-activity #:forevidence (evidence #f) 
                      #:answer (answer #f)
                      #:show-answer? (show-answer? #f)
                      . body)
  (apply styled-activity #:forevidence evidence
                         #:answer answer
                         #:show-answer? show-answer?
                         "csp-activity"
                         body))
  
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

;;;;;;;;;; Sections of Units ;;;;;;;;;;;;;;;;;;;;;;

(define (materials . items)
  (list (compound-paragraph bs-header-style 
                            (decode-flow (list "Materials and Equipment:")))
        (apply itemlist/splicing items #:style "BootstrapMaterialsList")))

(define (objectives . items)
  (list (compound-paragraph bs-header-style 
                            (decode-flow (list "Learning Objectives:")))
        (apply itemlist/splicing items #:style "BootstrapLearningObjectivesList")))

(define (evidence-statements . items)
  (list (compound-paragraph bs-header-style 
                            (decode-flow (list "Evidence Statements:")))
        (apply itemlist/splicing items #:style "BootstrapEvidenceStatementsList")))

(define (product-outcomes . items)
  (list (compound-paragraph bs-header-style 
                            (decode-flow (list "Product Outcomes:")))
        (apply itemlist/splicing items #:style "BootstrapProductOutcomesList")))

(define (exercises . content)
  (lesson-section "Exercises" content))

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

;; glossary-entry : string (string or #f) -> elem
;; generates markup for glossary entry; defn may be missing
(define (glossary-entry term defn)
  (let ([term-elem (elem #:style (bootstrap-span-style "vocab") term)])
    (if defn
        (elem term-elem ": " defn)
        term-elem)))

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

;;;;;;;;;;;;;;; Lessons ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; lesson-struct records the outline of a structure: basically, its
;; title, how long it takes, and the anchor to get to it within the
;; current document.
(struct lesson-struct (title     ;; (U string #f)
                       duration  ;; string e.g. "15 min"
                       anchor)   ;; string
  #:transparent)

;;;;;;;;;;; OLD LESSON FORMAT ;;;;;;;;;;;;;;;;;;;;;

;; This is currently used only in the teacher-notes.scrbl (for bs1).  Can remove this
;; if ever convert those over to lesson/studteach

;; lesson: #:title #:duration #:subsumes #:prerequisites #:video body ... -&gt; block
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

;;;;;;;;;;;;; CURRENT LESSON FORMAT ;;;;;;;;;;;;;;;;;;

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
     ;; the map of get-evidtag-std allows either std names or full evidence tags to
     ;;   be included in the list of standards. Our current code uses only the names
     ;;   but we may want to have the full tags for more refined generation later
     (set! 'standard-names (remove-duplicates (append (map get-evidtag-std standards)
                                                      (get 'standard-names '()))))
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

;;;;;;;;;;;; generating standards ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
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

;;;;;;;;;;; evidence statements ;;;;;;;;;;;;;;;;;;;;;;;;;;

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
                         (standards-link "Standards Document") 
                         " shows which units cover each standard. "
                         )
                   (list->itemization tag-formatted-LOtree 
                                      (list "LearningObjectivesList" "EvidenceStatementsList"))))))))))

;;;;; HTML elements for unit pages ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
                          (onclick "showGroup()")))
                (br)
                (input (@ (type "button")
                          (value "Slides")
                          (onclick "showSlides()")))))]
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

(define (insert-help-button)
  (para #:style (make-style #f (list (make-alt-tag "iframe") 
                                     (make-attributes (list (cons 'id "forum_embed"))))) 
        ""))
                                     
;;;;;;;;;;;;; Generating the Main Summary Page ;;;;;;;;;;;;;;;;;

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

;; unit-descr : list[element] -> block
;; stores the unit description to use in building the summary, then generates the text
(define-syntax (unit-descr stx)
  (syntax-case stx ()
    [(_ body ...)
     (syntax/loc stx
       (begin
         (set! current-the-unit-description (list body ...))
         current-the-unit-description))]))

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

;; summary-item/no-link : string -> block
;; produces an item for the unit summary with a title but no links
(define (summary-item/no-link name . descr)
  (para #:style "BSUnitSummary"
        (elem #:style "BSUnitTitle" name)
        descr))

;; summary-item/unit-link string string content -> block
;; generates summary entry in which unit name links to html version of lesson
;;   (contrast to summary-item/links, which links to both html and pdf versions)
(define (summary-item/unit-link name basefilename . descr)
  (para #:style "BSUnitSummary"
        (elem #:style "BSUnitTitle" (elem (hyperlink (format "~a.html" basefilename) name)))
        descr))

;; summary-item/links : string string content -> block
;; generate a summary entry links to html and pdf versions as
;;   used on the main page for a course
(define (summary-item/links name basefilename 
                            #:label1 (label1 "html") #:ext1 (ext1 "html") 
                            #:label2 (label2 "pdf") #:ext2 (ext2 "pdf") 
                            #:only-one-label? (only-one-label? #f)
                            . descr)
  (apply summary-item/custom name
         (if only-one-label?
             (list (hyperlink (format "~a.~a" basefilename ext1) label1)) 
             (list (hyperlink (format "~a.~a" basefilename ext1) label1)
                   (hyperlink (format "~a.~a" basefilename ext2) label2)))
         descr))

;; summary-item/custom : string list[hyperlink] pre-content -> block
;; generate a summary entry with given hyperlinks
;;   used on the main page for a course
;; CURRENTLY HANDLES ONLY TWO LINKS -- MUST GENERALIZE TO MORE
(define (summary-item/custom name links . descr)
  (if (= (length links) 2)
      (para #:style "BSUnitSummary"
            (elem #:style "BSUnitTitle" name)
            " ["
            (elem (first links))      
            " | "
            (elem (second links))
            "] - "
            descr)
      (para #:style "BSUnitSummary"
            (elem #:style "BSUnitTitle" name)
            " ["
            (elem (first links))      
            "] - "
            descr)))
      

;; unit-summary/links : number content -> block
;; generate the summary of a unit with links to html and pdf versions as
;;   used on the main page for the BS1 curriculum
;; previously used summary-item/links (for both html/pdf links)
(define (unit-summary/links num)
  (summary-item/unit-link (format "Unit ~a" num)
                          (format "units/unit~a/index" num)  ; index used to be "the-unit"
                          (get-unit-descr (format "unit~a" num))))

;;;;;;;;;; Unit summary generation ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (unit-length timestr)
  (list (format "Length: ~a~n" (decode-flow timestr))))

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
  
;creates the length of the lesson based on input
;input ONLY THE NUMBER!
(define (length-of-lesson l)
  (para #:style bs-header-style/span (format "Length: ~a minutes" l)))

(define (length-of-unit/auto)
  (traverse-block
   (lambda (get set)
     (lambda (get set)
       (length-of-lesson (get 'unit-length "No value found for"))))))

;;;;;;;;; Including lessons ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
;; NOTE: currently assumes lesson placed within a file named index.html
(define (extract-lesson mp)
  (define lesson-name (lesson-module-path->lesson-name mp))
  (define a-doc (parameterize ([current-lesson-name lesson-name])
                  (dynamic-require mp 'doc)))
  
  (unless (part? a-doc)
    (error 'include-lesson "doc binding is not a part: ~e" a-doc))
  ;; the document-output-path uses the basename of the scrbl source file.
  ;; Edited here to use index.html as the generated page name.  Will need a
  ;;  new way to indicate when to use index.html vs the actual base name if
  ;;  our infrastructures moves from the current "all lessons linked to directory
  ;;  pages" organization.
  (hash-set! (current-lesson-xref)
             lesson-name
             (list lesson-name (build-path (path-only (current-document-output-path)) "index.html")))
  
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
  (uri-encode (rem-spaces (string-append "lesson_" a-name))))

;;;;;;;; EXERCISE HANDOUTS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Tried factoring into own module, but too much sharing of styles
;;  and other basics needed for units/lessons

(define exercise-evid-tags list)

;; info required to locate an exercise within the filesystem
;;   will be used to generate links
;; the first form (our original notion) uses exercise-handout which
;;   contains metadata about evidence statements.  The no-meta
;;   version supports exercises that won't carry this metadata
;;   (at least for now)
(define-struct exercise-locator (lesson filename))
(define-struct (exercise-locator/dr-assess exercise-locator) (descr))

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
           (elem #:style (bootstrap-div-style/id "homeworkInfo") "")
           (elem #:style bs-title-style full-title)
           (nested #:style bs-content-style
                   (nested #:style bs-handout-style
                           (interleave-parbreaks/all
                            (cons (para #:style bs-exercise-instr-style (bold "Directions: ") 
                                        (italicize-within-string instr exercise-terms-to-italicize))
                                  body))))
           (copyright)))))

;; exercise-answers merely tags content.  The module reader will leave answers
;; in or remove them based on the solutions generation mode
(define (exercise-answers . body)
  body)

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
                                   (let ([next-char-str (peek-string 1 0)])
                                     (if (string=? next-char-str ";")
                                         (loop) ;; found a comment, read on next loop pass will skip over
                                         (let ([next-sexp (read)])
                                           (if (and (cons? next-sexp) (equal? (first next-sexp) 'exercise-handout))
                                               next-sexp
                                               (loop)))))]
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
                                     
;; generates the DOM for the additional exercises component of the unit page
;; the exercise-list.rkt file built up in this function gets used in the build
;;   process to identify which exercise files to copy over into the distribution
(define (gen-exercises)
  (traverse-block
   (lambda (get set)
     (lambda (get set)
       (with-output-to-file "exercise-list.rkt" (lambda () (printf "(")) #:exists 'replace)
       (let* ([exercise-locs (get 'exercise-locs '())]
              [exercise-output
               (if (empty? exercise-locs) (para)
                   (nested #:style (bootstrap-div-style "ExtraExercises")
                           (interleave-parbreaks/all
                            (list 
                             (para #:style bs-lesson-title-style "Additional Exercises:")
                             (apply itemlist/splicing 
                                    (map (lambda (exloc)
                                           (let-values ([(extitle exforevid) 
                                                         (if (exercise-locator/dr-assess? exloc)
                                                             (values (string-append "Check This Design Recipe: "
                                                                                    (exercise-locator/dr-assess-descr exloc))
                                                                     #f)
                                                             (extract-exercise-data exloc)
                                                             )])
                                             (let ([descr (if extitle extitle (exercise-locator-filename exloc))]
                                                   [support (if exforevid
                                                                (let ([evidstmt (get-evid-summary exforevid)])
                                                                  (if evidstmt (format " [supports ~a]" evidstmt)
                                                                      ""))
                                                                "")]
                                                   [extension (if (exercise-locator/dr-assess? exloc) ".pdf" ".html")]
                                                   )
                                               (let ([exdirpath (if (current-deployment-dir)
                                                                    (build-path (current-deployment-dir) "lessons") 
                                                                    (build-path lessons-dir))]
                                                     [expathname 
                                                      (build-path "lessons" (exercise-locator-lesson exloc) 
                                                                  "exercises" (string-append (exercise-locator-filename exloc) 
                                                                                             extension))])
                                                 (with-output-to-file "exercise-list.rkt" 
                                                   (lambda () (write (path->string expathname)) (printf " ")) 
                                                   #:exists 'append)
                                                 (elem (list (hyperlink #:style bootstrap-hyperlink-style
                                                                        (string-append "exercises/" (exercise-locator-lesson exloc) "/"
                                                                                       (exercise-locator-filename exloc) extension)
                                                                        descr)
                                                             ; uncomment next line when ready to bring evidence back in
                                                             ;(elem #:style (bootstrap-span-style "supports-evid") support)
                                                             ))))))
                                         exercise-locs))
                             ))))])
         (with-output-to-file "exercise-list.rkt" (lambda () (printf ")")) #:exists 'append)
         exercise-output)))))

;;;;;;;; LINKING BETWEEN COMPONENTS ;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (escape-webstring-newlines str)
  (string-replace str (list->string (list #\newline)) "%0A"))

;; create a link to a wescheme editor, possibly initialized with interactions/defn contents
(define (editor-link #:public-id (pid #f)
                     #:interactions-text (interactions-text #f)
                     #:definitions-text (definitions-text #f)
                     #:lang (lang (getenv "TARGET-LANG"))
                     #:cpo-version (cpo-version #f) ;"v0.5r852")
                     link-text)  
  (cond [(string=? lang "pyret") 
         (cond-element
          [html
           (sxml->element `(a (@ (href ,(if cpo-version 
                                           (format "https://code.pyret.org/editor#share=~a&v=~a" pid cpo-version)
                                           (format "https://code.pyret.org/editor#share=~a" pid)))
                                 (target "_blank"))
                              ,link-text))]
          [else (elem)])]
        [(string=? lang "racket") 
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
                [else (elem)])))]
        [else
         (printf "WARNING: editor-link has unknown lang ~a~n" lang)]))

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
;; The use of unit-to-resources-path reflects an assumption that all links are
;;  created within the-unit.html files.  Will need to add a param if other cases arise
(define (resource-link #:path resource-path
                       #:label [label #f])
  (let ([the-relative-path (build-path (unit-to-resources-path) resource-path)])
    (hyperlink #:style bootstrap-hyperlink-style
               (path->string the-relative-path)
               (if label label resource-path))))

;; produces a link to the standards documents
(define (standards-link descr)
  (hyperlink #:style bootstrap-hyperlink-style
             "http://www.bootstrapworld.org/materials/Standards.shtml"
             descr))

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
  
  ;(define-values (base-path _ dir?) (split-path src-path))
  (define the-relative-path (build-path (unit-to-resources-path) "workbook" "StudentWorkbook.pdf"))
    ;; what follows (comments) is Danny's original code.  Commenting out to
    ;; update to new deployment parameters, assuming we always link to PDF (for now)
    ;    (find-relative-path (simple-form-path (current-directory))
    ;                        (cond 
    ;                          ;; FIXME: communicate parameter values via parameters.
    ;                          ;; The reason it's not working right now is because we're
    ;                          ;; calling into scribble with system*, which means we don't
    ;                          ;; get to preserve any parameters between the build script
    ;                          ;; and us.
    ;                          [(getenv "WORKSHEET-LINKS-TO-PDF")
    ;                           (simple-form-path (get-worksheet-pdf-path))]
    ;                          [lesson
    ;                           (simple-form-path (build-path worksheet-lesson-root
    ;                                                         lesson
    ;                                                         "worksheets"
    ;                                                         (format "~a.html" name)))]
    ;                          [else
    ;                           (simple-form-path (build-path base-path
    ;                                                         'up
    ;                                                         "worksheets"
    ;                                                         (format "~a.html" name)))])))
  (list (hyperlink #:style bootstrap-hyperlink-style
                   (path->string the-relative-path)
                   "Page " (number->string 
                            (cond [page page] 
                                  [name (let ([num (get-workbook-page/name name)])
                                          (if num num
                                              (error 'worksheek-link (format "Unknown page name ~a" name))))]
                                  [else (begin (printf "WARNING: worksheet link needs one of page or name~n") 0)])))))

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
        (hyperlink #:style bootstrap-hyperlink-style
                   (string-append (path->string the-relative-path) "#" anchor)
                   (if label label lesson-name))]       
       ;; If not, fail for now by producing a hyperlink that doesn't quite go to the right place.
       [else
        (fprintf (current-output-port) "Warning: could not find cross reference to ~a\n" lesson-name)
        (define the-relative-path
          (find-relative-path (simple-form-path (current-directory))
                              (simple-form-path (build-path worksheet-lesson-root lesson-name "lesson" "lesson.html"))))
        (hyperlink #:style bootstrap-hyperlink-style
                   (path->string the-relative-path)
                   (if label label lesson-name))]))))

; generates HTML for a link to the Lulu direct-buy button, using Lulu image icon
(define (lulu-button) 
  (cond-element
   [html
    (sxml->element
     `(div (@ (style "float: right"))
           (a (@ (href "http://www.lulu.com/commerce/index.php?fBuyContent=14790241"))
              (img (@ (border "0") 
                      (alt "Support independent publishing: Buy this book on Lulu.")
                      (src "http://static.lulu.com/images/services/buy_now_buttons/en/book.gif?20140805085029"))))))]
   [(or latex pdf) (elem)]))

;;;;;;;;;;;; Page titles ;;;;;;;;;;;;;;;;;;;;;

;; generates the title, which includes the bootstrap logo in html but not in latex/pdf
(define (bootstrap-title #:single-line [single-line #f] . body)
  (define the-title (apply string-append body))
  (define unit+title (if single-line #f (regexp-match #px"^([^:]+):\\s*(.+)$" the-title))) 
  (define bootstrap-image (cond-element 
                           [html bootstrap.logo]
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

;;;;;;;;;;;;;; MISC HELPERS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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