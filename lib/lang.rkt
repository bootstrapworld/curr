#lang racket/base

;; This is a module that provides a Scribble-based language for
;; Bootstrap curricula.
;;
;; Much of the code here is just to bring all the components together
;; and to convince Scribble to include the support files (js, css)
;; whenever we Scribble a document in this language.

(require scribble/doclang
         scribble/base
         scribble/core
         scribble/decode
         scriblib/render-cond
         scribble/html-properties
         racket/runtime-path
         racket/path
         2htdp/image
         "bootstrap.rkt"
         "checker.rkt"
         "compile-time-params.rkt"
         "scribble-helpers.rkt"
         racket/splicing
         (for-syntax racket/base))



(provide (except-out (all-from-out scribble/doclang) #%module-begin)
         (all-from-out "bootstrap.rkt")
         (all-from-out "checker.rkt")
         (except-out (all-from-out scribble/base) title image item itemlist)
         (rename-out [fake-item item]
                     [itemlist/splicing itemlist])
         (rename-out [bootstrap-title title])
         (rename-out [module-begin #%module-begin])
         bitmap)

;;;;;;;;;;;;;;;;;;; content filtering ;;;;;;;;;;;;;;;;;;;;;

;; clean up replication in form-elements.rkt
(define-for-syntax (solutions-mode?) 
  (let ([env (getenv "CURRENT-SOLUTIONS-MODE")])
    ;(printf "Solutions mode is ~a ~n" env)
    (and env (string=? env "on"))))

;(define-for-syntax (process-lesson d)
;  ;; given a lesson point, extract just the activities from the student portions
;  (define (point->activitylist pt)
;    (let ([student-part (car pt)])
;      (filter (lambda (elt) (and (pair? elt) (eq? (car elt) 'activity))) student-part)))
;  ;; create list of all the activities across the points
;  (define (process-points plst)
;    (apply append (map point->activitylist plst)))
;  ;; alter lesson content based on mode
;  (cond [(solutions-mode?)
;         (map (lambda (elt) 
;                (if (and (pair? elt) (eq? (car elt) 'points)) 
;                    (process-points elt) 
;                    elt))
;              d)]
;        [else d]))

 
(define-for-syntax (process-lesson-contents clst)
  "Found lesson")

;; filters content from an exercise handout based on the solutions mode.
;;   - in solutions mode, keep only the answers (wrapped in exercise-answers)
;;   - in non-solutions mode, remove the answers
(define-for-syntax (process-exercise-handout-contents elst)
  (let ([body-filter
         (cond [(solutions-mode?) (lambda (synelt)
                                    ;(printf "have synelt ~a~n" synelt)
                                    (syntax-case synelt (exercise-answers exercise-evid-tags list)
                                      [(exercise-answers x ...) synelt]
                                      [(exercise-evid-tags x ...) synelt]
                                      [(_ ...) #f]
                                      [else synelt]))]
               [else (lambda (synelt) 
                       (syntax-case synelt (exercise-answers)
                         [(exercise-answers x ...) #f]
                         [(_ ...) synelt]
                         [else synelt]))])])
  (filter body-filter (syntax->list elst))))

(define-for-syntax (process-term e)
  (syntax-case e (exercise-handout unit-lessons lesson/studteach)
    [(exercise-handout x ...) 
     ;(printf "Found a handout~n")
     (with-syntax ([(new-elt ...) (process-exercise-handout-contents #'(x ...))])
       #'(exercise-handout new-elt ...))]
;    [(unit-lessons (lesson/studteach c) ...) 
;     (with-syntax ([(new-lesson ...) (process-lesson-contents #'(c ...))])
;       #'(unit-lessons (lesson/studteach new-lesson) ...))]
    [else e]))     

(define-for-syntax (process-body e)
  ;(printf "Processing doc body~n")
  (datum->syntax e (map process-term (syntax->list e))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  
(define-syntax (module-begin stx)
  (syntax-case stx ()
    [(_ id body ...)
     (with-syntax ([(new-body ...) (process-body #'(body ...))]) 
     #`(#%module-begin id change-defaults ()
                       (inject-javascript-url "http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js")
                       (splice (map inject-javascript-path js-paths))
                       (define the-unit-description #f)
                       (provide the-unit-description)
                       (splicing-syntax-parameterize 
                         ([current-the-unit-description
                           (make-rename-transformer #'the-unit-description)])
                         new-body ...)))]))


;; Our customized prefix simply declares the document as HTML5.
(define-runtime-path bootstrap-prefix.html (build-path "bootstrap-prefix.html"))

;; We include a customized bootstrap.css to help us modify the
;; presentation defaults of Scribble.
(define-runtime-path bootstrap.css (build-path "bootstrap.css"))


;; We also need to include the following files to make the dynamics work.
(define-runtime-path-list js-paths
  (list (build-path "easyXDM.min.js")
        (build-path "json2.min.js")
        (build-path "bootstrap-helpers.js")))



;; Here, we tell Scribble that we need to change the style of the
;; document here to fit the CSS styles we want for bootstrap.  We also
;; need to include the js files, the dependencies necessary to render
;; us.
(define (change-defaults doc)
  (struct-copy part doc
               [style (make-style (style-name (part-style doc))
                                  (list* (html-defaults bootstrap-prefix.html bootstrap.css js-paths)
                                         (style-properties (part-style doc))))]))


;; Helper: injects a <script> tag.
(define (inject-javascript-url a-url)
  (cond-element 
   [latex ""]
   [html (make-element (make-style #f (list (make-script-property "text/javascript"
                                                           a-url)))
                       '())]
   [text ""]))

;; Helper: injects a <script> tag, ripping out the directory portion
;; and assuming the script's in the same directory.
(define (inject-javascript-path a-path)
  (cond-element 
   [latex ""]
   [html (make-element (make-style #f
                                   (list (make-script-property "text/javascript"
                                                               (path->string (file-name-from-path a-path)))))
                       '())]
   [text ""]))

