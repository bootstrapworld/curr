#lang racket/base

;; Collects all the utility libraries into a single "bootstrap.rkt" for Scribble
;; users to include.
(require "tags.rkt"              ;; defines the conditional content generation
         "form-elements.rkt"     ;; defines our customized Scribble elements
         "data-repository.rkt"   ;; will define the server-side data storage
         )



(provide (all-from-out "tags.rkt")
         (all-from-out "form-elements.rkt")
         (all-from-out "data-repository.rkt")
         )
