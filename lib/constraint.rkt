#lang racket/base

(require (for-syntax racket/base))


;; A quantified pred is:
(struct every (pred))
;; or just an atomic pred.


;; An atomic pred is:
(struct nonempty? (val))
(struct numeric? (val))
;; (... truly, we want a more generic, match-like language for
;; describing the shapes of expressions, or allow for arbitrary
;; predicates that we can evaluate through WeScheme or Whalesong.  We
;; will need to revisit this.)


;; A val, the argument to an atomic pred, is the value we should be
;; able to get from a form element:
(struct field (id))
(struct ith-field (id))
;; We may need to generalize this in the context of multi-component
;; form elements, such as the REPL.
