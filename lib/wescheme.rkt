#lang racket/base

;; Provides support for embedded WeScheme instances.

(require net/uri-codec
         racket/match
         scribble/decode
         scribble/html-properties
         scribble/core
         scriblib/render-cond
         (only-in scribble/manual racket)
         (for-syntax racket/base
                     syntax/to-string)
         "javascript-support.rkt")

(provide embedded-wescheme
         inject-embedding-libraries
         example)







(define-syntax (example stx)
  (syntax-case stx ()
    [(_ thing options ...)
     (with-syntax ([text (syntax->string #'(thing))])
       (syntax/loc stx
         (splice (list 
                  (racket thing)
                  (embed-wescheme #:interactions-text text
                                  #:auto-run? #t
                                  #:hide-header? #t
                                  #:hide-footer? #t
                                  #:hide-definitions? #t
                                  #:with-rpc? #t
                                  #:width 500
                                  #:height 50)))))]))



(define (inject-embedding-libraries)
  (splice (list
           (inject-javascript-file "http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js")
           (inject-javascript-file "easyXDM.min.js")
           (inject-javascript-file "json2.min.js")
           (inject-javascript-file "wescheme-embedded.js"))))
          



;; helper functions for embedding internal instances of WeScheme.
(define (embedded-wescheme #:id (id (symbol->string (gensym 'wescheme)))

                           #:public-id (pid #f)
                           #:width (width "90%")
                           #:height (height 500)

                           #:with-rpc? (with-rpc? #f)

                           #:interactions-text (interactions-text #f)
                           #:definitions-text (definitions-text #f)
                           #:warn-on-exit? (warn-on-exit? #f)
                           #:hide-header? (hide-header? #t)
                           #:hide-toolbar? (hide-toolbar? #f)
                           #:hide-project-name? (hide-project-name? #t)
                           #:hide-footer? (hide-footer? #t)
                           #:hide-definitions? (hide-definitions? #f)
                           #:hide-interactions? (hide-interactions? #f)
                           #:auto-run? (auto-run? #f))

  (define pid-or-interactions-alist-chunk
    (cond
     [pid
      `(publicId . ,pid)]
     [interactions-text
      `(interactionsText . ,interactions-text)]
     [definitions-text
      `(definitionsText . ,definitions-text)]
     [else
      (error 'embed-wescheme "#:pid, #:definitions-text, or #:interactions-text must be provided")]))

  (define (maybe-add-option y/n name)
    (if y/n
        `((,name . "true"))
        `((,name . "false"))))

  (define encoded-alist
    (parameterize ([current-alist-separator-mode 'amp])
      (alist->form-urlencoded
       `(,pid-or-interactions-alist-chunk
         ,@(maybe-add-option with-rpc? 'embedded)
         ,@(maybe-add-option warn-on-exit? 'warnOnExit)
         ,@(maybe-add-option hide-header? 'hideHeader)
         ,@(maybe-add-option hide-toolbar? 'hideToolbar)
         ,@(maybe-add-option hide-project-name? 'hideProjectName)
         ,@(maybe-add-option hide-footer? 'hideFooter)
         ,@(maybe-add-option hide-definitions? 'hideDefinitions)
         ,@(maybe-add-option hide-interactions? 'hideInteractions)
         ,@(maybe-add-option auto-run? 'autorun)))))

  (define url
    (string-append
     "http://www.wescheme.org/openEditor?"
     encoded-alist))

  (splice
   (list (sxml->element
          `(div
            (@ (id ,id)
               (class "embedded-wescheme"))
            ""))
         (inject-javascript
          (format "document.getElementById(~s).style.width=~s; document.getElementById(~s).style.height=~s;"
                  id
                  (dimension->string width)
                  id
                  (dimension->string height)))
         (inject-javascript
          (format (if with-rpc?
                      "document.getElementById(~s).controller = WeSchemeEmbedded.withRpc(~s, ~s)"
                      "document.getElementById(~s).controller = WeSchemeEmbedded.withoutRpc(~s, ~s);")
                  id
                  url
                  id)))))


;; dimension->string: (U number string) -> string
;; Translate a dimension into a string.
(define (dimension->string dim)
  (cond
   [(number? dim)
    (string-append (number->string dim) "px")]
   [(string? dim)
    dim]
   [else
    (error 'dimension->string "Don't know how to translate ~e to a dimension" dim)]))


