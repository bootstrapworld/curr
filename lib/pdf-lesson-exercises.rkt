#lang racket

(provide pdf-lesson-exercises)

;; spec of the files that must get generated as PDFs
;; ideally, this should be generated during unit traversal, but
;; use this manual interface for now
(define pdf-lesson-exercises
  '(("Practicing-the-Design-Recipe" ("calc-pencils-assess-recipe.scrbl")
                                    )
    )
  )