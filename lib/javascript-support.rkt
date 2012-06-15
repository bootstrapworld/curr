#lang racket/base

;; this supports javascript evaluation for Scribble.
(require scribble/html-properties
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