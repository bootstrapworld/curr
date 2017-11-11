#lang racket

;; API to extract standards/objectives/evidence data from spreadsheet

(require (planet neil/csv:1:=7) ; csv library
         racket/runtime-path
         "paths.rkt"          ; needed while we load the standards from csv file
         )
         
(provide get-standard-descr
         get-learnobj-tree
         get-evid-statement/tag
         get-evid-summary
         get-used-evidnums/std
         get-evidtag-std
         )

;; location of the standards csv file (must be a path)
(define-runtime-path lib-path (build-path 'up "lib"))
(define STDS-CSV-FILE (build-path lib-path "langs" (getenv "LANGUAGE") "standards.csv"))
(define STDS-GDRIVE-SOURCE "https://docs.google.com/spreadsheet/ccc?key=0AjzMl1BJlJDkdFRkR0RRRUJqa21oZHJ3WEhHWE1IVHc&usp=sharing#gid=0")

;;;;; STANDARDS TREE DATA DEFN ;;;;;;;;;;;;;;;;;;;;;;;;;

;; (make-standard string string list[learnobj])
(define-struct standard (tag descr learnobjs))
;; (make-learnobj (number string list[evidstmt])
(define-struct learnobj (id descr evidence))
;; (make-evidstmt (number string string))
(define-struct evidstmt (id descr coverage))

;; the standardslist is a list of standards

;;;;; CSV TO STANDARDS TREE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; The csv file has four columns: a tag (combining standard and objective label),
;; a description of the objective, the evidence statements, and whether or not
;; we claim to cover the objective.
;;
;; The original design of these data structures separated the standard and the
;; objective.  The description of each standard will now be taken from the
;; single learning objective per tag (thus we will have replication between the
;; standard description and the learning objective.  Might want to rewrite later
;; but duplication preserves the rest of the code for now.

(define (read-csv filename)
  (call-with-input-file filename
    (lambda (p)
      (csv->list (make-csv-reader p '((separator-chars #\,)))))))

(define csv-raw (read-csv STDS-CSV-FILE))

(define (cluster-lines-by-firstcol csvlist)
  (let loop ([unprocessed csvlist] [currstd empty] [finishedstds empty])
    (if (empty? unprocessed) ;; include currstd in finishedstds list
        (append finishedstds (list currstd))
        (cond [(string=? "" (caar unprocessed)) ;; line still part of currstd
               (loop (rest unprocessed) 
                     (append currstd (list (first unprocessed))) 
                     finishedstds)]
              [else ;; current line starts a new standard; archive previous and start new one
               (loop (rest unprocessed) 
                     (list (first unprocessed))
                     (if (empty? currstd) ;; base-case -- processing first standard 
                         empty
                         (append finishedstds (list currstd))))]))))

;; takes strings of form "num. text" and decomposes into two
;;   values, one for number and one for text.  If string
;;   doesn't have that form, returns #f and the original string
(define (extract-id-descr str)
  (let ([labeled? (regexp-match #rx"([0-9]+)\\.(.*)" str)])
    (if labeled?
        (values (string->number (second labeled?)) (third labeled?))
        (values #f str))))

;; converts the csv contents (as a list) into a tree of standards,
;;   learning objectives, and evidence statements.  Need to refine
;;   once KF and ES agree on the spreadsheet format
(define (csvlist-to-standards-tree csvlist)
  (let ([clusters (cluster-lines-by-firstcol csvlist)])
    (map (lambda (cluster)
           (make-standard 
            (caar cluster) (cadar cluster)
            (map (lambda (learnobj-cluster)
                   (let-values ([(id descr) (extract-id-descr (caar learnobj-cluster))])
                     (make-learnobj id descr
                                    (map (lambda (evstr coveragestr) 
                                           (let-values ([(id descr) (extract-id-descr evstr)])
                                             (make-evidstmt id descr coveragestr)))
                                         (map second learnobj-cluster) (map third learnobj-cluster)))))
                 (cluster-lines-by-firstcol (map cdr cluster)))))
         clusters)))

;; use rest to strip out the header line on the spreadsheet
(define standards-tree (csvlist-to-standards-tree (rest csv-raw)))  

;;;;; EXTRACT DATA FROM TREE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (find-std/tag tag)
  (let ([matches (filter (lambda (std) (string=? tag (standard-tag std))) 
                         standards-tree)])
    (if (empty? matches)
        (printf (format "WARNING: find-std/tag finds no standard for tag ~a~n" tag))
        (first matches))))

;; given a standard id-tag, extract the description string for that id
(define (get-standard-descr tag)
  (let ([std (find-std/tag tag)])
    (if (void? std) #f (standard-descr std))))

;; determine whether evidence statement is considered covered versus a list of coverage tags
;; uses string-trim to protect against whitespace in spreadsheet values
(define (evid-covered-by taglist)
  (lambda (e)
    (member (string-trim (evidstmt-coverage e)) taglist)))

;; return list of descriptions of all covered evidence statements
(define (get-evidence-descrs/coverage evidstmtlst coverage-tags)
  (map evidstmt-descr (filter (evid-covered-by coverage-tags) evidstmtlst)))

;; given standard id-tag, produce list of ((lobj (evidence ...) tag) ...) for that standard
;; optionally include tag name with lobj name (reasonable since spreadsheet conflates std and lobj)
(define (get-learnobj-tree std-tag 
                           #:include-tag [include-tag? #t] 
                           #:with-coverage [with-coverage (list "Y" "N")])
  (let* ([std (find-std/tag std-tag)]
         [lobjs (if (void? std) '() (standard-learnobjs std))])
    (map (lambda (lobj)
           (list ;std-tag
                 (learnobj-descr lobj)
                 ;(if include-tag? 
                 ;    (format "~a: ~a" std-tag (learnobj-descr lobj))
                 ;    (learnobj-descr lobj))
                 (get-evidence-descrs/coverage (learnobj-evidence lobj) with-coverage)
                 std-tag))
         lobjs)))

;; takes a string and converts to a 1-based index ("A" -> 1, "B" -> 2, etc)
;; Prints warning if string is other than a single capital letter 
(define (cap-string->index-num str)
  (if (= (string-length str) 1)
      (let ([str-int (char->integer (string-ref str 0))])
        (if (<= 65 str-int 90)
            (- (char->integer (string-ref str 0)) 64)
            (printf "WARNING: string for evidence index not a capital letter: ~a~n" str)))
      (printf "WARNING: string for evidence index longer than 1 characeter: ~a~n" str)))

;; returns evidence statement (string) for given std string and numeric labels for 
;;   learning objective and evidence statement
;; NOTE: CSP uses capital letters to number evidence statements.  This code
;;    therefore accepts a capital letter as the evidence index. 
(define (get-evid-statement std learnindex evidindexorig)
  (let ([report-problem (lambda (msg) (printf "WARNING: get-evid-stmt: ~a~n" msg) #f)]
        [lotree (get-learnobj-tree std)]
        [evidindex (if (string? evidindexorig) (cap-string->index-num evidindexorig) evidindexorig)]
        )
    ;;; (printf "Tree is: ~a~n~n" lotree)
    (cond [(empty? lotree) #f] ;; if this happens, find-std/tag already reported unknown standard error
          [(not lotree) (report-problem (format "no learning objectives for standard ~a" std))]
          [(or (< learnindex 1) (> learnindex (length lotree))) 
           (report-problem (format "no learning objective with index ~a for standard ~a" learnindex std))]
          [(or (< evidindex 1) (> evidindex (length (second (list-ref lotree (sub1 learnindex)))))) 
           (report-problem (format "no evidence statement with index ~a for standard ~a and objective ~a" 
                                   evidindex std learnindex))]
          ; if want to print the letter that goes with the statement, augment the following line
          [else (list-ref (second (list-ref lotree (sub1 learnindex))) (sub1 evidindex))])))

(define (get-evid-statement/tag evidtag)
  (let-values ([(std lonum esnum) (evidtag-data evidtag)])
    (if (not (or std lonum esnum)) #f
        (get-evid-statement std lonum esnum))))

;; the evidence tag list is coming in quoted, so need to remove the leading operator
;;   if it is there.  Current operator name is "exercise-evid-tags", as defined
;;   in the macros for parsing solutions in lang.rkt
(define (get-evid-summary evidtag)
  (if (list? evidtag)
      (map get-evid-statement/tag (if (memq (first evidtag) '(exercise-evid-tags)) (rest evidtag) evidtag))
      (get-evid-statement/tag evidtag)))

;; an evidence tag has the form std&learnobj&evid, where learnobj and evid are numbers
(define evidtag-regexp #rx"(.+)&([0-9]+)&([0-9A-Z]+)")

;; returns values for the standard, learning objective number, and evidence number from a tag
;;   if the given string has the wrong format, returns #f
;; The suppress-errors optional argument should be turned on/used only in situations
;;   when we expect that the string might not be a valid evidtag (such as in get-evidtag-std,
;;   which may be given just a std name or an entire tag)
(define (evidtag-data evidtagstr #:suppress-errors (suppress-errors? #f))
  (let ([data (regexp-match evidtag-regexp evidtagstr)])
    (if data
        (values (second data) (string->number (third data)) (string->number (fourth data)))
        (begin
          (unless suppress-errors?
            (printf "WARNING: malformed evidence tag ~a~n" evidtagstr))
          (values #f #f #f)))))

;; extracts the std name from a string which may be a full evidence tag.
;; This allows us to put either std names or entire std tags in lesson metadata
(define (get-evidtag-std evidtag)
  (let-values ([(std lonum esnum) (evidtag-data evidtag #:suppress-errors #t)])
    (or std evidtag)))

;; given standard tag and a list of evidence tag, return list of indices of those in evid-used
;; ASSUMES only one learning objective per standard
(define (get-used-evidnums/std stdtag evid-used)
  (remove-duplicates
   (foldr (lambda (evidtagstr result-rest)
            (let-values ([(evidstd lo evidnum) (evidtag-data evidtagstr)])
              (if (equal? evidstd stdtag) (cons evidnum result-rest) result-rest)))
          '() evid-used)))
  
;;;;; ATTIC ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; convert master spreadsheet to csv
;(system (format "cscript xls2csv.vbs ~a ~a" MASTER-SPREADSHEET MASTER-CSV))
;(define MASTER-CSVLIST (make-parameter #f))
