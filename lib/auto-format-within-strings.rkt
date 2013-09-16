#lang racket

(provide format-key-terms)

;; keep all but the first and last elements of a list
;;  assumes alst has length at least 2
(define (all-but-first-rest alst)
  (reverse (rest (reverse (rest alst)))))

;; If the extra-chars are at the front of str, remove them
;;   otherwise return str unchanged
(define (rem-chars-front str extra-chars)
  (let ([extra-len (string-length extra-chars)])
    (if (and (string? str)
             (>= (string-length str) extra-len)
             (string=? extra-chars (substring str 0 extra-len)))
        (substring str extra-len)
        str)))

;; If the extra-chars are at the end of str, remove them
;;   otherwise return str unchanged
(define (rem-chars-end str extra-chars)
  (let ([extra-len (string-length extra-chars)])
    (if (and (string? str)
             (>= (string-length str) extra-len)
             (string=? extra-chars
                       (substring str (- (string-length str) extra-len))))
        (substring str 0 (- (string-length str) extra-len))
        str)))

;; strips uses of extra-chars from first and last items in list (if they are strings).
;; if the entire first or last item is the extra-chars, remove that string entirely
(define (strip-extras str-content-list extra-chars)
  (if (= 1 (length str-content-list))
      (list (rem-chars-end (rem-chars-front (first str-content-list) extra-chars) extra-chars))
      (let ([firstelt (first str-content-list)]
            [lastelt (last str-content-list)]
            [extra-len (string-length extra-chars)])
        (let ([newfirst (rem-chars-front firstelt extra-chars)]
              [newlast (rem-chars-end lastelt extra-chars)])
          (append (if (string=? "" newfirst) '() (list newfirst))
                  (all-but-first-rest str-content-list)
                  (if (string=? "" newlast) '() (list newlast)))))))
  
;; reformat: string string (string->content) -> list[String or content]
;; replaces each use of second string with some scribble content, returning
;;   a list of the remaining substrings and new content
;; assumes that the term string is not empty
;; the extended-str is needed because string-split appears to lose uses of
;;   the term at the start and end of the string. We add dummy characters
;;   to the start and end so string-split will catch everything, then remove
;;   the extra chars at the end
(define (reformat str term convert)
  (if (not (string? str)) (list str)
      (let* ([extra-chars "!#+"]
             [extended-str (string-append extra-chars str extra-chars)] 
             [strs-to-keep (string-split extended-str term)]
             [insert-term (convert term)])
        (strip-extras
         (let loop ([keep strs-to-keep])
           (cond [(empty? keep) empty]
                 [(empty? (rest keep)) (list (first keep))]
                 [else (append (list (first keep) insert-term) (loop (rest keep)))]))
         extra-chars))))

;; reformats each key-term in str according to convert function.
;;   convert function takes a string and produces content
;; assumes that no key-term is a subterm of another key-term
(define (format-key-terms str key-terms convert)
  (let loop ([terms key-terms] [decomp (list str)])
    (if (empty? terms) 
        decomp
        (let ([nexts (map (lambda (dstr) 
                            (reformat dstr (first terms) convert)) 
                          decomp)])
          (loop (rest terms) (apply append nexts))))))
      
;; Tests
(define (run-tests)
  (reformat "" "a" string-upcase)
  (reformat "" "Circle" string-upcase)
  (reformat "Circle the marks" "Circle of Evaluation" string-upcase)
  (reformat "Mark each Circle please" "Circle" string-upcase)
  (reformat "Mark each circle please" "Circle" string-upcase)
  (reformat "Circle the Expressions" "Circle" string-upcase)
  (reformat "Circle the Expressions" "Expressions" string-upcase)
  (format-key-terms "Mark each Circle in the Expr please" (list) string-upcase)
  (format-key-terms "Mark each Circle in the Expr please" (list "Circle" "Expr") string-upcase)
  )