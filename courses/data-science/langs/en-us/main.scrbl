#lang curr/lib

@main-contents{
@(elem #:style bs-coursename-style "Bootstrap:Data Science")

Information and knowledge can be gained through computational processes. An important form of computed knowledge comes from the analysis of data.

@(logosplash "../../splash.png" "DataScienceLogo.png")

@; workbook link names and targets

@(apply itemlist
        (append
         (for/list ([n (in-range 1 10)])
           (unit-summary/links n))
        ))     

@(copyright)
}
