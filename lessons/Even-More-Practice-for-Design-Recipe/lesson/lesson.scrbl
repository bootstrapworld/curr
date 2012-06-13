#lang curr/lib
@declare-tags[pedagogy group selftaught]
@lesson[#:title "Even More Practice (Yard Area)"
        #:duration "20 minutes"]{
  @itemlist/splicing[
     @item{Okay, now it's time for the final round. When I say go, @tag[group]{teams will } turn to @worksheet-link[#:page 13 #:name "Design-Recipe-Yard-Area"], and begin. @tag[group]{This time, each time will have 5 minutes to }Read the problem statement, write the contract, and fill out the examples. @tag[group]{One point for each section. } Any questions? On your mark ... get set ... GO!}
     @tag[pedagogy]{@item{Time 5 minutes, count down the last 10 seconds, and then collect answers from teams. Keep score!}}
     @item{Now @tag[group]{you'll have 5 more minutes to }finish the Design Recipe@tag[group]{, } and @tag[group]{to }type in your function and test cases. On your mark ... get set ... GO!}
     @tag[pedagogy]{@item{Time 5 minutes, count down the last 10 seconds, and then collect answers from teams. Keep score!}}
     @tag[pedagogy]{@item{If time allows, pass out extra Design Recipe worksheets [@(hyperlink "PDF" "PDF") | @(hyperlink "OOo" "OOo")], and run another round: e.g., one of 
           @code{(define (years-ago year) (- 2011 year))
                 (define (plural word) (string-append word "s"))
                 (define (diamond size color) (rotate 45 (rectangle size size "solid" color)))
                 }}}]}