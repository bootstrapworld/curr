#!/usr/bin/env racket
#lang racket/base
(require; racket/runtime-path
         ;racket/system
         ;racket/string
         ;racket/cmdline
         ;racket/path
         ;racket/file
         ;racket/list
         ;racket/match
         ;racket/vector
         ;(for-syntax racket/base)
         ;(planet neil/csv:1:=7)
         ;"lib/system-parameters.rkt"
         ;"lib/translate-pdfs.rkt"
         ;"lib/paths.rkt"
         ;"lib/build-helpers.rkt"
         ;"lib/build-modes.rkt"
         ;"lib/scribble-pdf-helpers.rkt"
         ;"lib/pdf-lesson-exercises.rkt"
         ;"lib/warnings.rkt"
         scribble/render
         scribble/html-render
         ;file/zip
         "courses/intro/langs/en-us/main.scrbl"
         )

(render (list doc)
        '("index")
        #:render-mixin (compose render-multi-mixin render-mixin)
        #:dest-dir "distribution/courses/intro/en-us/")
