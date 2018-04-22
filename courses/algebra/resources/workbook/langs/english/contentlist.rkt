; This file specifies the pages that make up the numbered portion of the 
; workbook for the course containing this resources/workbook directory.  

; The list should contain names of either .scrbl or .pdf files that 
; are in the workbook/pages directory.  Each list element must 
; include either a .scrbl or a .pdf extension.
;
; The list may also contain entries of the form (skip <integer>).
; Currently (Apr 2018) we are inserting the extra exercises from
; each unit into the workbook; those exercise pages are not
; explicitly listed in the content list, so page numbering was
; off.  The (skip N) markers are a temporary hack so adjust the
; page numbering to accommodate the extra exercises (N should be
; one more than the number of exercises to insert, to account
; for the "unit exercises" page that is also included).

; The workbook will be generated from these pages in order

(
 ;;;;; UNIT 1 ;;;;;;;;;
 ("ColleenPages.pdf" "Unit-1")
 ("StudentWorkbook.pdf" "NinjaCat-Dissection")
 ("StudentWorkbook.pdf" "NinjaCat-Coordinates")
 ("StudentWorkbook.pdf" "Game-Design")
 ("StudentWorkbook.pdf" "Circle-of-Evaluation-Practice")
 (skip 15)
 ;;;;; UNIT 2 ;;;;;;;;;
 ("ColleenPages.pdf" "Unit-2")
 ("StudentWorkbook.pdf" "Circle-of-Evaluation-Practice-2")
 (skip 5)
 ;;;;; UNIT 3 ;;;;;;;;;
 ("ColleenPages.pdf" "Unit-3")
 ("StudentWorkbook.pdf" "Fast-Functions")
 ("StudentWorkbook.pdf" "Fast-Functions2")
 (skip 4)
 ;;;;; UNIT 4 ;;;;;;;;;
 ("ColleenPages.pdf" "Unit-4")
 "rocket-height.scrbl"
 "lawn-area.scrbl"
 "red-square.scrbl"
 (skip 8)
 ;;;;; UNIT 5 ;;;;;;;;;
 ("ColleenPages.pdf" "Unit-5")
 "update-danger.scrbl"
 "update-target.scrbl"
 ;;;; UNIT 6 ;;;;;;;;;
 ("ColleenPages.pdf" "Unit-6")
 ("StudentWorkbook.pdf" "Protecting-Sam")
 "safe-left.scrbl"
 "safe-right.scrbl"
 ("StudentWorkbook.pdf" "AND-and-OR")
 "onscreen.scrbl"
 (skip 8)
 ;;;; UNIT 7 ;;;;;;;;;
 ("ColleenPages.pdf" "Unit-7")
 "cost.scrbl"
 "update-player.scrbl"
 (skip 5)
 ;;;; UNIT 8 ;;;;;;;;;
 ("ColleenPages.pdf" "Unit-8")
 "line-length.scrbl"
 ("StudentWorkbook.pdf" "distance-example")
 "distance.scrbl"
 "collide.scrbl"
 ;;;; UNIT 9 ;;;;;;;;;
 ("ColleenPages.pdf" "Unit-9")
 ("StudentWorkbook.pdf" "Game-Summary")
 ("StudentWorkbook.pdf" "Lines")
 ("StudentWorkbook.pdf" "Feedback")
 ("StudentWorkbook.pdf" "Feedback")
 "red-shape.scrbl"
 ("StudentWorkbook.pdf" "Translating-to-Algebra")
 ("StudentWorkbook.pdf" "Math-Rocket-Distance")
 ("StudentWorkbook.pdf" "Math-Rocket-Time")
 ("StudentWorkbook.pdf" "Math-Rocket-Collision")
 ("StudentWorkbook.pdf" "Math-Blank-Recipe")
 ("StudentWorkbook.pdf" "Math-Blank-Recipe")
 )