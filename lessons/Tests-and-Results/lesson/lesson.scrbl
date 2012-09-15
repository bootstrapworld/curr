#lang curr/lib

@declare-tags[group pedagogy selftaught]
@lesson[#:title "Introduction"
        #:duration "25 minutes"]{
          @itemlist/splicing[
            @item{Now open your own gamefiles.}
@item{The first thing to do is to reformat your update-world function so that it uses cond, with your current code being the else clause. You have 5 minutes - GO!}
@item{Copy and paste your off-left? and off-right? functions into your game. Take one more minute - GO!}
@item{5, 4, 3, 2, 1...MONITORS OFF!}
@item{Now pick think about the things in your game that flies offscreen. Do they fly off the left? The right? The top or bottom? Do you need to write off-top? or off-bottom?}
@item{On page 34, make a list of the tests that you need to do in the left hand column, to decide whether each thing flies offscreen. For example, with the dog we said (off-right? (world-dogX w)). On the right, figure out which world you need to make, so that the thing you're testing re-appears on screen once it's flown off.}
@item{Work in small groups to complete the workbook page.}]}