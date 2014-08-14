#lang racket

(provide pdf-lesson-exercises)

;; spec of the files that must get generated as PDFs
;; ideally, this should be generated during unit traversal, but
;; use this manual interface for now
(define pdf-lesson-exercises
  '(("Practicing-the-Design-Recipe" ("calc-pencils-assess-recipe.scrbl"
				     "check-total-design-recipe-assess.scrbl"
				     "circle-area-design-recipe-assess.scrbl"))
    ("Danger-and-Target-Movement" ("target-leap-design-recipe-assess.scrbl"))
    ("Booleans" ("long-name-design-recipe-assess.scrbl"
    		 "enough-cash-design-recipe-assess.scrbl"
		 "equal-length-design-recipe-assess.scrbl"
		 "enough-carpet-design-recipe-assess.scrbl"))
    ("Luigis-Pizza" ("scale-shape-design-recipe-assess.scrbl"
                     "state-tax-design-recipe-assess.scrbl"
		     "flower-name-design-recipe-assess.scrbl"
		     "turkey-price-design-recipe-assess.scrbl"))
    ("Collide" ("late-to-class-design-recipe-assess.scrbl"))
    ("Onscreen2" ("offscreen-design-recipe-assess.scrbl"))
   )
)
