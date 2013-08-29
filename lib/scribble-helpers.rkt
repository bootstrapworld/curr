#lang racket

;; various generic scribble helper functions

(require (prefix-in wescheme: "wescheme.rkt")
         scribble/base
         scribble/core
         scribble/decode
         scribble/basic
         ;"checker.rkt"
         )

(provide append/itemization
         remdups/itemization
         fake-item
         ;all-defined-out  --> why isn't this working???
         )

(provide/contract [itemlist/splicing
                   (->* () 
                        (#:style (or/c style? string? symbol? #f)) 
                        #:rest list?
                        itemization?)]
                 )

;;;;; ITEMIZATIONS ;;;;;;;;;;;;

;; append contents of two scribble itemizations, keeping style of the second
(define (append/itemization items1 items2)
  (cond [(empty? items2) items1]
        [(empty? items1) items2]
        [else
         (make-itemization (itemization-style items2)
                           (append (itemization-blockss items1) (itemization-blockss items2)))]))

;; remove duplicates in an itemlist
(define (remdups/itemization itemz)
  (let ([items (apply append (itemization-blockss itemz))])
    (apply itemlist (remove-duplicates items equal?))))

;; fake-item: (listof any) -> (listof any)
;; We try to make itemlist more pleasant to work with.  Itemlist/splicing automatically
;; wraps items around every argument, so there's no need to call item explicitly.
;; We provide a fake definition for fake-item that just returns the identity.
(define (fake-item . args)
  args)

;; itemlist/splicing is like itemlist, but also cooperates with the
;; splice form to absorb arguments.  
(define (itemlist/splicing #:style [style #f] . items)
  (define spliced-items
    (reverse
     (let loop ([items items]
                [acc '()])
       (foldl (lambda (i acc)
                (cond
                  [(splice? i)
                   (loop (splice-run i) acc)]
                  [(item? i)
                   (cons i acc)]
                  [else
                   (cons (item i) acc)]))
              acc
              items))))
  (apply itemlist spliced-items #:style style))

;; converts a racket nested list (of strings) into a scribble
;; itemization.  Classnames is a list of strings,
;; one for each nesting level in the input list.
;; these strings get used as classnames in the generated
;; itemization
(define (list->itemization eltlist classnames)
  (let ([stylename (if (empty? classnames) #f (first classnames))]
        [remclassnames (if (empty? classnames) empty (rest classnames))])
    (apply itemlist/splicing #:style stylename
           (map (lambda (elt)
                  (if (not (list? elt)) 
                      (elem elt)
                      (compound-paragraph (make-style #f '())
                       (list (para (first elt))
                             (list->itemization (second elt) remclassnames)))))
                eltlist))))

;(list->itemization '("hi" ("mom" ("sis"))) (list "a" "b"))
  
  
  