#lang racket/base

(require "sxml.rkt"
         (prefix-in wescheme: "wescheme.rkt")
         racket/runtime-path
         racket/stxparam
         scribble/base
         scribble/core
         scribble/decode
         scribble/html-properties
         (for-syntax racket/base))


;; FIXME: must add contracts!
(provide row
         current-row
         
         fill-in-the-blank
         free-response
         embedded-wescheme
         
         ;; Sections
         worksheet
         lesson
         drill

         ;; Itemizations
         materials
         goals)





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




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(define-runtime-path bootstrap.css "bootstrap.css")
(define (bootstrap-sectioning-style name)
  (make-style name (list (make-css-addition bootstrap.css)
                         ;; Use <div/> rather than <p/>
                         (make-alt-tag "div"))))


;; The following provides sectioning for bootstrap.  They provide
;; worksheets, lessons, and drills.
(define (worksheet . body)
  (compound-paragraph (bootstrap-sectioning-style "BootstrapWorksheet")
                      (decode-flow body)))


(define (lesson . body)
  (compound-paragraph (bootstrap-sectioning-style "BootstrapLesson")
                      (decode-flow body)))


(define (drill . body)
  (compound-paragraph (bootstrap-sectioning-style "BootstrapDrill")
                      (decode-flow body)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (materials . items)
  (list "Materials:"
        (apply itemlist items #:style "BootstrapMaterialsList")))


(define (goals . items)
  (list "Goals:"
        (apply itemlist items #:style "BootstrapGoalsList")))
