#lang racket/base
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
     #'(begin
         (begin-for-syntax
          (for ([tag '(tag-name ...)])
               (hash-set! known-tags tag #t)))
         (define-syntax (tag-name stx-2)
           (syntax-case stx-2 ()
             [(_ body (... ...))
              (syntax/loc stx-2
                (tag tag-name body (... ...)))]
             [else
              (raise-syntax-error #f "~s is a tag, not a normal expression" stx-2)]))
         ...)]))


(define-syntax (tag stx)
  (syntax-case stx ()
    [(_ tag body ...)
     (identifier? #'tag)
     (generate-tagged-for-code stx (list #'tag) #'(body ...))]

    [(_ (tag ...) body ...)
     ;; FIXME: must make sure it's a unique list of identifiers.
     (andmap identifier? (syntax->list #'(tag ...)))
     (generate-tagged-for-code stx (syntax->list #'(tag ...)) #'(body ...))]))