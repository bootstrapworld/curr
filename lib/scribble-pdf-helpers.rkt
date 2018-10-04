#lang racket

(require racket/system
         "paths.rkt"
         "system-parameters.rkt"
         scribble/render
         )

(provide get-prog-cmd
         scribble-again?
         scribble-files
	 scribble-to-pdf)

; cross-platform helper for locating executables.  Looks for progname with and without .exe extension
(define (get-prog-cmd progname)
 (let ([progpath (or (find-executable-path (string-append progname ".exe"))
                     (find-executable-path progname)
                     )])
   (if progpath progpath
       (error (format "Unable to find program ~a~n" progname)))))

;; 7/6/18: this tried to get too fancy: we scribbled to the deployment-dir directly,
;; but the unit exercises appear multiple places, so we scribble/wkhtmltopdf them
;; multiple times, which is costly.  We need to have the output-dir here be the source
;; dir for the scribble file, then modify the build script elsewhere to copy exercise
;; htl/pdf files into place, rather than scribble them into place. (or maybe not --
;; don't we need them scribbled with different css files for workbook and website??)
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

;; determine whether a file needs to be re-scribbled either because
;; it was modified since its last scribbling or because the
;; css file was updated.
;; scrbl-file is just <file>.scrbl; path is the dir containing that file
(define (scribble-again? scrbl-file path pagesdir)
  (let* ([fhtml (regexp-replace #px"\\.scrbl$" scrbl-file ".html")]
         [fhtmlpath (build-path pagesdir fhtml)])
    (or (not (file-exists? fhtmlpath))
        (> (file-or-directory-modify-seconds (build-path path scrbl-file))
           (file-or-directory-modify-seconds fhtmlpath))
        (> (file-or-directory-modify-seconds (build-path root-path "lib" "workbook.css"))
           (file-or-directory-modify-seconds fhtmlpath))
        )))

;; run scribble on each .scrbl file in the pages listing
;; wkbk-mod-sec could be #f if the previous workbook file is not available
;; 7/6/18 -- remove the wkbk-mod-sec parameter
(define (scribble-files pages pagesdir extra-exercises-dir wkbk-mod-sec)
  (let ([scribble-ran? #f])
    (for-each (lambda (f)
                (cond
                  [(and (string? f)
                        (regexp-match #px".*\\.scrbl$" f)
                        (scribble-again? f pagesdir pagesdir))
                   (set! scribble-ran? #t)
                   (run-scribble (build-path pagesdir f))
                   (let ([fhtml (regexp-replace #px"\\.scrbl$" f ".html")]
                         [fpdf (regexp-replace #px"\\.scrbl$" f ".pdf")])
                     ; -q option is for "quiet" operation
                     (system* (get-prog-cmd "wkhtmltopdf") "--lowquality" "--print-media-type" "-q"
                              (build-path pagesdir fhtml)
                              (build-path pagesdir fpdf)))]
                  [(and (list? f) (= (length f) 3)
                        (regexp-match #px".*\\.scrbl$" (second f))
                        (scribble-again? (second f) (build-path extra-exercises-dir (third f) "exercises")
                                         pagesdir))
                   (set! scribble-ran? #f)
                   (let ([exercise-dir (build-path extra-exercises-dir (third f) "exercises")])
                     (run-scribble (build-path exercise-dir (second f)))
                     (let ([fhtml (regexp-replace #px"\\.scrbl$" (second f) ".html")]
                           [fpdf (regexp-replace #px"\\.scrbl$" (second f) ".pdf")])
                       ; -q option is for "quiet" operation
                       (system* (get-prog-cmd "wkhtmltopdf") "--lowquality" "--print-media-type" "-q"
                                (build-path pagesdir fhtml)
                                (build-path pagesdir fpdf))))]
                  ))
              pages)
    scribble-ran?))

; Avoiding naming conflicts with the more general run-scribble
; function in the build script (shouldn't need two functions, but have never
; worked on merging them properly)
(define (scribble-to-pdf pages pagesdir)
  (scribble-files pages pagesdir pagesdir #f))
