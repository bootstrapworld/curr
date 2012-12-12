#lang racket/base

(require racket/stxparam
         (for-syntax racket/base))
(provide (all-defined-out))

(define-syntax-parameter current-the-unit-description
  (lambda (stx) 
    (raise-syntax-error #f "Outside the context of a bootstrap-language-based module" stx)))
