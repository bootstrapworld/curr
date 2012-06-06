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
         (for-syntax racket/base)
         "bootstrap.rkt")



(provide (except-out (all-from-out scribble/doclang) #%module-begin)
         (all-from-out "bootstrap.rkt")
         (all-from-out scribble/base)
         (rename-out [module-begin #%module-begin]))

(define-syntax (module-begin stx)
  (syntax-case stx ()
    [(_ id . body)
     #`(#%module-begin id change-defaults ()
                       (inject-javascript-url "http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js")
                       (splice (map inject-javascript-path js-paths))
                       . body)]))


;; Our customized prefix simply declares the document as HTML5.
(define-runtime-path bootstrap-prefix.html (build-path "bootstrap-prefix.html"))

;; We include a customized bootstrap.css to help us modify the
;; presentation defaults of Scribble.
(define-runtime-path bootstrap.css (build-path "bootstrap.css"))


;; We also need to include the following files to make the dynamics work.
(define-runtime-path-list js-paths
  (list (build-path "easyXDM.min.js")
        (build-path "json2.min.js")
        (build-path "wescheme-embedded.js")
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

