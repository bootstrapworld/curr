#lang curr/lib

@declare-tags[pedagogy selftaught group]

@lesson[#:title "Double" #:duration "10 minutes" #:prerequisites "Fast-Functions"]{

@itemlist/splicing[
         @tag[pedagogy]{@item{@think-about[#:question @list{I want a volunteer to be a function called "double", which takes in a number and multiplies it by two. @tag[pedagogy]{Hand the sign to the student.} So if I say "double 3", what will I get back?"}]}}
         @tag[selftaught]{@item{Now think of a function that takes in a number and multiplies it by two. @think-about[#:question "What would double 3 be?" #:answer "6"]}} 
         @tag[pedagogy]{@item{Have a couple of students try out the function by giving examples}}
         @tag[pedagogy]{@item{You will have TWO minutes to write down that contract and two examples. Once you've got your examples, RAISE YOUR HAND and call me over, so I can check them. Two minutes, ready - go!}}
         @tag[pedagogy]{@item{Give the countdown, then review answers with the class and assign points.}}
         @tag[pedagogy]{@item{Raise your hand if you think you know how you could write an example for "double". (If you get blank stares, give them ONE example on the board. Otherwise, smile and move on.)}}
         @tag[group]{@item{Your groups will now have FIVE minutes to write two examples, and then circle and label what has changed. Then you can fill out the function header and body. Once you've got your examples, RAISE YOUR HAND and call me over, so I can check them. Do NOT go on to the function header and body until I have checked your examples! Any questions? GO!}}
         @tag[pedagogy]{@item{Give the countdown, then review answers with the class and assign points. If time allows, do another example, preferably one where the domain is something besides numbers.}}
                 @tag[selftaught]{@item{@embedded-wescheme[#:id "Double"
                   #:definitions-text "; Try out Double"]}}]}