#lang racket

; Defines functions for creating new styles for bootstrap content

(require racket/runtime-path
         scribble/core
         scribble/html-properties
         scribble/latex-properties
         ;(prefix-in neturl: net/url) ;; so we can load mathjax from a url
	 "math-rendering.rkt"
       )

(provide bootstrap-sectioning-style
         bootstrap-paragraph-style 
	 bootstrap-div-style
	 bootstrap-div-style/id
	 bootstrap-div-style/id/nested
	 bootstrap-div-style/extra-id
	 bootstrap-span-style/extra-id
	 bootstrap-span-style
	 bootstrap-span-style/id
	 bootstrap-agenda-style
         bootstrap-hyperlink-style
	 bootstrap-style
	 bs-head-additions
	 make-bs-latex-style 
	 bs-title-style
	 bs-content-style
	 audience-in?
         bs-coursename-style
)

;;;;;;;;;;;;;;;;; Runtime Params ;;;;;;;;;;;;;;;;;;;;;;;;;

;; aud is either a string or a list of strings of audience tags
;;  known tags are student, teacher, volunteer, and self-taught
(define (audience-in? aud)
  (member (getenv "AUDIENCE") (if (list? aud) aud (list aud))))

;;;;;;;;;;;;;;;; Runtime Paths ;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define-runtime-path bootstrap.css "bootstrap.css")
(define-runtime-path bootstrap-pdf.tex "bootstrap-pdf.tex")
(define-runtime-path textbook.css "textbook.css")
(define-runtime-path pretty-printing.css "pretty-printing.css")
(define-runtime-path cards.css "cards.css")
(define-runtime-path codemirror.js "codemirror.js")
(define-runtime-path codemirror.css "codemirror.css")
(define-runtime-path runmode.js "runmode.js")
(define-runtime-path scheme2.js "scheme2.js")
(define-runtime-path pyret-mode.js "pyret-mode.js")
(define-runtime-path bootstraplesson.js "bootstraplesson.js")
(define-runtime-path workbook.css "workbook.css")
(define-runtime-path overview-styles.css "styles.css")

(define css-js-additions
  (list (make-tex-addition bootstrap-pdf.tex)
        (make-css-addition bootstrap.css)
        (make-css-addition pretty-printing.css)
        (make-css-addition codemirror.css)
        (make-js-addition codemirror.js)
        (make-js-addition runmode.js)
        (make-js-addition scheme2.js)
        (make-js-addition pyret-mode.js)
        (make-js-addition bootstraplesson.js)
        (make-js-addition mathjax-url)
        (cond [(audience-in? (list "student")) (make-css-style-addition cards.css)]
              [(member (getenv "BOOTSTRAP-TARGET") (list "workbook")) (make-css-style-addition workbook.css)]
              [else (make-css-style-addition textbook.css)])
        )) 

(define overview-pages-css-js-additions
  (list (make-css-style-addition overview-styles.css)
        ))

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

(define bootstrap-hyperlink-style
  (make-style #f (cons (make-attributes (list (cons 'target "_blank")))
                       css-js-additions)))

;; bootstrap-style : string -> style
;; defines a style for both latex and css with the given name
(define (bootstrap-style name)
  (make-style name (cons (make-alt-tag "span")
                         css-js-additions)))

;; add meta attributes to HEAD (needed for iPhone rendering)
(define bs-head-additions
  (make-head-extra 
   '(meta ((name "viewport")
           (content "width=device-width, initial-scale=1, user-scalable=no")))))

;; make-bs-latex-style : string -> style
;; defines a style that will only be used in latex
(define (make-bs-latex-style name) 
  (make-style name (list (make-tex-addition bootstrap-pdf.tex))))

;;;;;;;; Shared styles ;;;;;;;;;;;;;;;;;;;;

(define bs-title-style (bootstrap-style "BootstrapTitle"))
(define bs-content-style (bootstrap-div-style "content"))

(define bs-coursename-style (make-style "BSCourseName" overview-pages-css-js-additions))


