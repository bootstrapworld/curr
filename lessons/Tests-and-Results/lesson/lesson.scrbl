#lang curr/lib

@declare-tags[group pedagogy selftaught]
@lesson[#:title "Tests and Results"
        #:duration "45 minutes"]{
          @itemlist/splicing[
            @item{Now open your own game file.}
@item{The first thing to do is to reformat your @code{update-world} function so that it uses @code{cond}, with your current code inside the @code{else} clause. @tag[pedagogy]{You have 5 minutes - GO!}}
@item{Next copy and paste your @code{off-left?} and @code{off-right?} functions from Ninja World into your game. @tag[pedagogy]{Take one more minute - GO!}}
@pedagogy{@item{5, 4, 3, 2, 1...MONITORS OFF!}}
@item{Think about the things in your game that fly offscreen. Do they fly off the left? The right? The top or bottom? Do you need to write @code{off-top?} or @code{off-bottom?}}
@item{On @worksheet-link[#:page 34 #:name "Test and Result"], make a list of the tests that you need to do in the left hand column, to decide whether each thing flies offscreen. For example, with the dog we said @code{(off-right? (world-dogX w))}. On the right, figure out which world you need to make, so that the thing you're testing re-appears on screen once it's flown off.}
@pedagogy{@item{Work in small groups to complete the workbook page.}}]}
