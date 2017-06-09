#lang racket

; Functions for creating scribbled exercises 

(require scribble/base
         scribble/basic
         scriblib/render-cond
         "scribble-helpers.rkt"
         "styles.rkt"
         "process-code.rkt"  ; for sexp
         "sxml.rkt"
         "racket2pyret.rkt"
         "./../translating/translator.rkt"
         )

(provide fill-in-the-blank
         free-response
         contract-exercise
         create-exercise-itemlist
         create-exercise-itemlist/contract-answers
         create-exercise-sols-itemlist
         questions-and-answers
         open-response-exercise
         fill-in-blank-answers-exercise
         circeval-matching-exercise/code
         circeval-matching-exercise/math
         matching-exercise
         matching-exercise-sols
         matching-exercise-answers
         completion-exercise
         three-col-exercise
         three-col-answers
         )

;;;;;; Styles ;;;;;;;;;;;;;;;;

(define bs-contract-exercise-style (make-bs-latex-style "BSContractExercise"))
(define bs-fill-in-blank-style (make-bs-latex-style "BSFillInBlank"))
(define bs-free-response-style (make-bs-latex-style "BSFreeResponse"))

;;;;;;; Basic Exercise Types ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Inputs: string number string string -> element
;; Generates a single-line input area
(define (fill-in-the-blank #:id (id "nonunique-id")
                           #:columns (width 50)
                           #:label (label #f)
                           #:class (classname #f)
                           #:answer (answer #f))
  (cond-element [html
                 (elem #:style (bootstrap-span-style classname) "")] ;"answer here"
                [(or latex pdf)
                 (elem #:style bs-fill-in-blank-style 
                       (if label label " "))]))
;
;;; Inputs: string element number number string -> element
;;; Generates a multi-line input area of size given in column/row arguments
;; This is not in active use in current build.  Used in hw and worksheet dirs inside units
(define (free-response #:id id
                       #:answer (answer #f)
                       #:columns (width 50)
                       #:rows (height 20)
                       #:label (label #f))
  (cond-element 
   [html (sxml->element `(textarea (@ (id ,id)
                                      (cols ,(number->string width))
                                      (rows ,(number->string height))
                                      ,@(if label
                                            `((placeholder ,label))
                                            '()))
                                   ""))]
   [(or latex pdf)
    (elem #:style bs-free-response-style (number->string width) (number->string height))]))

;; Inputs: string [string] [string] [string] -> element
;;         optional argument supply answers for the workbook
;; Produces element with blanks for an exercise to fill in a contract
;; only used by create-exercise-itemlist
(define (contract-exercise tag #:name [name-ans #f] #:domain [domain-ans #f] #:range [range-ans #f])
  (cond-element [html
                 (elem "; " (fill-in-the-blank #:id (format "~aname" tag) #:label (translate 'contract-name) #:class "contract-name studentAnswer")
                       " : " (fill-in-the-blank #:id (format "~aarg" tag) #:label (translate 'contract-domain) #:class "contract-domain studentAnswer")
                       " -> " (fill-in-the-blank #:id (format "~aoutput" tag) #:label (translate 'contract-range) #:class "contract-range studentAnswer"))]
                [(or latex pdf)
                 (elem #:style bs-contract-exercise-style "")]))

;;;;;;;;;;;; Exercise itemlists ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (create-exercise-itemlist #:ordered [ordered? #t] 
                                  #:itemstyle [itemstyle #f]
                                  contents)
  (create-itemlist #:style (if ordered? 'ordered #f)
                   (map (lambda (c) (para #:style (or itemstyle (bootstrap-div-style "ExerciseListItem")) 
                                          c))
                        contents)))

(define (create-exercise-itemlist/contract-answers #:ordered [ordered? #t] contents)
  (create-exercise-itemlist #:ordered ordered? 
                            (map (lambda (c) (list (contract-exercise "dummyid") c)) contents)))

(define (create-exercise-sols-itemlist #:ordered [ordered? #t] questions answers)
  (questions-and-answers questions answers))

;;;;;;;;;; Two-column open-response exercise ;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; generates a two-column layout with blanks for the answers in the right column
;;   answer-type argument used to control the amount of space left for answers
;; two-col-layout will pad the given empty list to match the length of colA
(define (open-response-exercise colA answer-type)
  (unless (member answer-type '("circeval" "code" "math" "text"))
    (error 'open-response-exercise (format "Unexpected answer type ~a~n" answer-type)))
  (two-col-layout #:rightcolextratag (string-append "studentAnswer " answer-type)
                  colA '()))
                     
;;;;;;;; Two-column fill-in-the-blank exercise ;;;;;;;;;;;;;;;;;;;;;;;;;;

;; creates an elem containing string with index number before each elt in list
(define (add-index-nums/elem elts)
  (map (lambda (e index) (elem (format "~a." index) e))
       elts (build-list (length elts) (lambda (i) (add1 i)))))

;; generates a table with questions in the left column and blank lines in the right
(define (fill-in-blank-answers-exercise questions #:numbered? (numbered? #t))
  (let* ([numberedques (if numbered? (add-index-nums/elem questions) questions)]
         [rowslist (map (lambda (ques) 
                          (list ques (fill-in-the-blank #:class "studentAnswer")))
                        numberedques)])
    (tabular #:style "matching-table" rowslist)))

;;;;;;; Circles of evaluation matching exercises ;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Given a list of sexps as strings, create a matching exercise between
;;   the expressions and circle-of-eval forms.  Can optionally take the
;;   list of permuted sexpstrs as a second argument (if don't want
;;   the permutation done automatically).  
(define (circeval-matching-exercise/code sexplst . permutedstrs)
  (let ([textlst (map (lambda (str) (sexp str #:form "code")) sexplst)])
    (if (empty? permutedstrs)
        (matching-exercise 
         #:permute #t
         textlst
         (map (lambda (str) (sexp str #:form "circofeval")) sexplst))
        (matching-exercise
         textlst
         (map (lambda (str) (sexp str #:form "circofeval")) (first permutedstrs))))))
       
(define (circeval-matching-exercise/math mathexps sexps #:permute (permute #f))
  (matching-exercise #:permute permute 
                     mathexps 
                     (map (lambda (str) (sexp str #:form "circofeval")) sexps)))

;;;;;;;;;;;;; Matching Exercises ;;;;;;;;;;;;;;;;;;;;;;

;; given two lists of content, produces an exercise to match each item in
;;   colA with one from colB.  If permute is true, then contents of colB
;;   are permuted before generating the output.
;; Pads lists as needed to balance length (allows some matches to not be used)
;; real-matching? distinguishes actual matching exercises that need labels on
;;   the right column from cases that use this to generate twoColumnLayouts (like answer blanks)
(define (matching-exercise #:permute [permute #f] 
                           colA colB)
  (let* ([permutedB (if permute (permute-list colB) colB)]
         [paddedcolA (if (> (length colB) (length colA)) (pad-to colA (length colB) "") colA)]
         [paddedcolB (if (> (length colA) (length colB)) (pad-to permutedB (length colA) "") permutedB)])
    (two-col-layout #:layoutstyle "matching"
                    paddedcolA paddedcolB)))

;; gets the lowercase letter label of an answer from a list of answers
;;  intended to compute original label of answer in a matching problem
(define (matching-label #:compare-with [compare-with eq?] ans presented-order)
  (int-index->char-index (get-index #:compare-with compare-with ans presented-order)))

;; format a question and answer for a solution key
(define (attach-exercise-answer question answer)
  (nested #:style (bootstrap-div-style "question-with-answer") question (bold (string-append " " (translate 'exercise-answer) ": ")) answer))  

;; given answer key for matching exercise, generate solutions
(define (matching-exercise-sols matches)
  (matching-exercise (map (lambda (m) (attach-exercise-answer (first m) (second m))) matches)
                     '()))

;; annotates each answer in a matching exercise with the label of the
;;   answer in the presented problem
(define (matching-exercise-answers #:compare-with [compare-with eq?] 
                                   #:content-of-ans [content-of-ans #f]
                                   #:some-no-match? [some-no-match? #f]
                                   ques formatted-ans presented-ans)
  (let ([annotated-ans 
         (map (lambda (ansF ansC)
                (with-handlers ([(lambda (e) (eq? e 'get-index-elt-not-found))
                                 (lambda (e)
                                   (if some-no-match?
                                       (elem #:style "matchLabelAns" (translate 'exercise-noAnswer))
                                       (raise 'matching-exercise-answers (format (string-append (translate 'exercise-noMatch) " ~a") ansC))))])
                  (let ([label (matching-label #:compare-with compare-with
                                               ansC presented-ans)])
                    (nested #:style (bootstrap-div-style "labeledRightColumn")
                            (interleave-parbreaks/all
                             (list (para #:style (bootstrap-span-style "rightColumnLabel") label)
                                   ansF))))))
              formatted-ans (or content-of-ans formatted-ans))])
    (two-col-layout #:layoutstyle "solutions matching" ques annotated-ans)))

;;;;;;;;;; Completion Exercises ;;;;;;;;;;;;;;;;;

;; generate a two-column layout with no special formatting towards item labeling
(define (completion-exercise colA colB)
  (two-col-layout colA colB))

;;;;;;; Foundational Helpers ;;;;;;;;;;;;;;;

;; generic function for creating a two-column layout.  Not meant to be called
;; directly from .scrbl files.  Mostly used for exercise generation
(define (two-col-layout #:leftcolextratag [leftcolextratag ""]
                        #:rightcolextratag [rightcolextratag ""]
                        #:layoutstyle [layoutstyle ""]
                        colA colB)
  (two-or-three-col-layout #:leftcolextratag leftcolextratag
                           #:rightcolextratag rightcolextratag
                           #:layoutstyle layoutstyle
                           #:include-center? #f
                           colA colB '()))

;; generic function for creating a three-column layout.  Not meant to be called
;; directly from .scrbl files.  Mostly used for exercise generation
(define (two-or-three-col-layout #:leftcolextratag [leftcolextratag ""]
                                 #:centercolextratag [centercolextratag ""]
                                 #:rightcolextratag [rightcolextratag ""]
                                 #:include-center? [include-center? #t]
                                 #:layoutstyle [layoutstyle ""]
                                 colA colB colC)
  (let* ([maxcollength (max (length colA) (length colB) (length colC))]
         [paddedcolA (pad-to colA maxcollength "")]
         [paddedcolB (pad-to colB maxcollength "")]
         [paddedcolC (pad-to colC maxcollength "")]
         [leftcolstyle (bootstrap-div-style (string-append "leftColumn" " " leftcolextratag))]
         [centercolstyle (bootstrap-div-style (string-append "centerColumn" " " centercolextratag))]
         [rightcolstyle (bootstrap-div-style (string-append "rightColumn" " " rightcolextratag))])
    (create-itemlist #:style (string-append "twoColumnLayout " layoutstyle)
                     (if include-center?
                         (map (lambda (left center right)
                                (interleave-parbreaks/all
                                 (list 
                                  (nested #:style leftcolstyle left)
                                  (nested #:style centercolstyle center)
                                  (nested #:style rightcolstyle right))))
                              paddedcolA paddedcolB paddedcolC)
                         (map (lambda (left right)
                                (interleave-parbreaks/all
                                 (list 
                                  (nested #:style leftcolstyle left)
                                  (nested #:style rightcolstyle right))))
                              paddedcolA paddedcolB)))))

(define three-col-exercise two-or-three-col-layout)
(define three-col-answers two-or-three-col-layout)
(define questions-and-answers two-col-layout)

;; produces list with same elements as input list, but with order permuted
(define (permute-list lst)
  (let loop ([sourcelst lst])
    (if (empty? sourcelst) empty
        (let ([choose (list-ref sourcelst (random (length sourcelst)))])
          (cons choose (loop (remove choose sourcelst)))))))

;; adds copies of with-elt to alst to produce list of length to-len
;;   if alst already longer than to-len, return alst unchanged
(define (pad-to alst to-len with-elt)
  (if (>= (length alst) to-len) alst
      (let ([extras (build-list (- to-len (length alst)) (lambda (i) with-elt))])
        (append alst extras))))

;; converts a numeric list index (0-based) to a lowercase char index
(define (int-index->char-index i)
  (format "~a" (integer->char (+ i 97))))

;; produces 0-based index of element in list, defaults to eq? as comparator
(define (get-index #:compare-with [compare-with eq?] elt lst)
  (let loop [(index 0) (L lst)]
    (cond [(empty? L) (raise 'get-index-elt-not-found)]
          [(compare-with (first L) elt) index]
          [else (loop (add1 index) (rest L))])))
