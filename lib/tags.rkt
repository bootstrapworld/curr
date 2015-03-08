#lang racket/base

;; at some point, we stopped maintaining the tagging infrastructure (allowing for
;; different versions of the files to get generated based on a set of declared tags.
;; Kathi can no longer remember what the issue was that we chose not to fix, but
;; she also couldn't get the tags working again.  The commented out part at the
;; bottom was the last known tags interface.  The part up top is an attempt to
;; provide a poor-man's tagging infrastructure until we figure out what went wrong
;; with the old one or remove the old infrastructure entirely.

;; next step on this is to remove tags.rkt entirely and move the functions defined
;; here into form-elements.  Waiting to confirm with rest of team that we don't want
;; to ressurect the tagging infrastructure before doing that.

(require scribble/base
         scribble/core
         scribble/decode
         "scribble-helpers.rkt"
         )

(provide declare-tags
         management
         group
         selftaught)

(define (declare-tags . args) "")

(define (group . body) "")
(define (selftaught . body) "")

(define (management . body)
  (nested #:style "management" 
          (interleave-parbreaks/select body)))

#|

;; Implementation for the conditional content generation.  We do the
;; decision for the conditional generation at compile-time.
;;
;;
;; I'm trying to figure out how to do this at run-time instead.  See:
;; http://lists.racket-lang.org/users/archive/2012-May/052229.html
;; Hopefully I'll get an answer about this soon.

;;
;; Also, we should really be using syntax-parse, as it will let us
;; provide more robust macros with good error messages.


(require racket/splicing
         (prefix-in scribble: scribble/decode)
         (prefix-in scribble: scribble/core)
         (prefix-in scribble: scribble/base)
         (for-syntax racket/base
                     racket/block))


(provide declare-tags tag)


(begin-for-syntax

 ;; We'll use this as our environment variable.
 (define SCRIBBLE-TAGS-ENV-VAR "SCRIBBLE_TAGS")

 (define known-tags (make-hash))

 (define (check-known-tag! src-stx tag-stx)
   (cond
    [(hash-has-key? known-tags (syntax-e tag-stx))
     (void)]
    [else
     (raise-syntax-error #f "Tag has not been declared with declare-tags." src-stx tag-stx)]))
 

 (define (generate-tagged-for-code src-stx tags bodies)
   (with-syntax ([(body ...) bodies])
     (for ([t tags]) (check-known-tag! src-stx t))
     ;; I would really like to push this compile-time check to
     ;; runtime, but I'm having a difficult type getting traverse
     ;; elements to cooperate with splice, which I need so that we
     ;; can wrap sections with this.  I suspect I need to cooperate
     ;; with decode in some funky way.
     (define enabled-tags
       (if (getenv SCRIBBLE-TAGS-ENV-VAR)
           (map string->symbol (regexp-split #px"\\s+" (getenv SCRIBBLE-TAGS-ENV-VAR)))
           '()))
     (cond
      [(for/or ([tag tags]) (member (syntax-e tag) enabled-tags))
       #'(scribble:splice (list body ...))]
      [else
       #'(scribble:splice (list))]))))
     
 


(define-syntax (declare-tags stx)
  (syntax-case stx ()
    [(_ tag-name ...)
     (with-syntax ([(string-tag-name ...)
                    (map (lambda (stx) (symbol->string (syntax-e stx))) (syntax->list #'(tag-name ...)))])
     #`(begin
         (begin-for-syntax
          (for ([tag '(tag-name ...)])
               (hash-set! known-tags tag #t)))
         (define-syntax (tag-name stx-2)
           (syntax-case stx-2 ()
             [(_ body (... ...))
              (syntax/loc stx-2
                (tag tag-name 
                     (scribble:nested #:style (scribble:style string-tag-name '())
                                      body (... ...))))]
             [else
              (raise-syntax-error #f (format "~s is a tag, not a normal expression" 'tag-name) stx-2)]))
         ...))]))


(define-syntax (tag stx)
  (syntax-case stx ()
    [(_ tag body ...)
     (identifier? #'tag)
     (generate-tagged-for-code stx (list #'tag) #'(body ...))]

    [(_ (tag ...) body ...)
     ;; FIXME: must make sure it's a unique list of identifiers.
     (andmap identifier? (syntax->list #'(tag ...)))
     (generate-tagged-for-code stx (syntax->list #'(tag ...)) #'(body ...))]))

|#