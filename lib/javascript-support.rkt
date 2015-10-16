#lang racket/base

;; sxml->element and tagged->element are also defined in
;; lib/sxml.rkt -- merge if ever start using this file again

;; this supports javascript evaluation for Scribble.
(require scribble/html-properties
         scribble/base
         scribble/core
         scriblib/render-cond
         racket/match
         (only-in scribble/manual racket))
         
(provide inject-javascript 
         inject-javascript-file
         sxml->element
         tagged->element)


;; Adds JavaScript if we're rendering in HTML.
(define (inject-javascript . body)
  (cond-element 
   [latex ""]
   [html (make-element (make-style #f (list (make-script-property "text/javascript"
                                                           body)))
                       '())]
   [text ""]))



(define (inject-javascript-file path-name)
  (cond-element 
   [latex ""]
   [html (make-element (make-style #f (list (make-script-property "text/javascript"
                                                           path-name)))
                       '())]
   [text ""]))

;; sxml->element: sxml -> element
;; Embeds HTML content into a Scribble document.
(define (sxml->element an-sxml)
  (match an-sxml
    [(list '& 'nbsp)
     'nbsp]
    [(list '& sym)
     sym]

    [(list tag-name (list '@ (list attr-name attr-value) ...) children ...)
     (tagged->element tag-name attr-name attr-value children)]
    
    [(list tag-name children ...)
     (tagged->element tag-name '() '() children)]

    [(? symbol?)
     an-sxml]
    
    [(? string?)
     an-sxml]

    [(? char?)
     (string an-sxml)]))



(define (tagged->element tag-name attr-names attr-values children)
  (define tag-attr (alt-tag (symbol->string tag-name)))
  (define attrs-attr (attributes (map cons attr-names attr-values)))
  (define content (map sxml->element children))
  (make-element (make-style #f (list tag-attr attrs-attr))
                content))

#|
Kathi commented this out on Oct 15 2015.  This file hadn't been loaded
in over a year, but got pulled in again to restore embedded-weschemes.
Don't think we use/need this function, so commented it out to avoid
checksyntax error on constraint->js not being defined.

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
|#