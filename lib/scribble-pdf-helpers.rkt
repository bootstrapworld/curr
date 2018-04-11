#lang racket

(require racket/system
         "paths.rkt"
         "system-parameters.rkt"
         scribble/render
         )

(provide get-prog-cmd
         scribble-files
   scribble-to-pdf)

; cross-platform helper for locating executables.  Looks for progname with and without .exe extension
(define (get-prog-cmd progname)
 (let ([progpath (or (find-executable-path (string-append progname ".exe"))
                     (find-executable-path progname) 
                     )])
   (if progpath progpath
       (error (format "Unable to find program ~a~n" progname)))))

(define (run-scribble scribble-file)
  (printf "Scribbling ~a~n" scribble-file)
  (define output-dir (current-deployment-dir))
  (define-values (base name dir?) (split-path scribble-file))
  (define output-path (build-path output-dir (string->path (regexp-replace #px"\\.scrbl$" (path->string name) ".html"))))
  (parameterize ([current-directory base]
                 [current-document-output-path output-path])
    (render (list (dynamic-require `(file ,(path->string name)) 'doc))
            (list name)
            #:dest-dir output-dir))
  (void))

;; run scribble on each .scrbl file in the pages listing
;; wkbk-mod-sec could be #f if the previous workbook file is not available
(define (scribble-files pages pagesdir extra-exercises-dir wkbk-mod-sec)
  (define (htmlToPDF fhtml fpdf)
    (system* (get-prog-cmd "wkhtmltopdf") 
                              "--lowquality"                  ;; reduce DPI
                              "--print-media-type"            ;; use @print media stylesheets
                              "--window-status" "printready"  ;; wait for the pages to tell us they're ready...
                              "--javascript-delay" "1500"     ;; ...but time out at 1.5sec
                              "--quiet"                       ;; suppress console output
                            (build-path pagesdir fhtml)
                            (build-path pagesdir fpdf)))
  (for-each (lambda (f)
              (cond
                [(and (string? f) 
                      (regexp-match #px".*\\.scrbl$" f)
                      (or (not wkbk-mod-sec)
                          (< wkbk-mod-sec (file-or-directory-modify-seconds (build-path pagesdir f)))
                          (< wkbk-mod-sec (file-or-directory-modify-seconds (build-path root-path "lib" "workbook.css")))
                          #t))
                 
                 (run-scribble (build-path pagesdir f))
                 (let ([fhtml (regexp-replace #px"\\.scrbl$" f ".html")]
                       [fpdf (regexp-replace #px"\\.scrbl$" f ".pdf")])
                   (htmlToPDF fhtml fpdf))]
                [(and (list? f) (= (length f) 3)
                      (regexp-match #px".*\\.scrbl$" (second f))
                      (or (not wkbk-mod-sec)
                          (< wkbk-mod-sec (file-or-directory-modify-seconds (build-path (build-path extra-exercises-dir (third f) "exercises") (second f))))
                          (< wkbk-mod-sec (file-or-directory-modify-seconds (build-path root-path "lib" "workbook.css")))
                          #t))
                 (let ([exercise-dir (build-path extra-exercises-dir (third f) "exercises")])
                   (run-scribble (build-path exercise-dir (second f)))
                   (let ([fhtml (regexp-replace #px"\\.scrbl$" (second f) ".html")]
                         [fpdf (regexp-replace #px"\\.scrbl$" (second f) ".pdf")])
                     (htmlToPDF fhtml fpdf)))])
              )
            pages))

; Avoiding naming conflicts with the more general run-scribble
; function in the build script (shouldn't need two functions, but have never
; worked on merging them properly)
(define (scribble-to-pdf pages pagesdir)    
  (scribble-files pages pagesdir pagesdir #f))