#lang curr/lib

@declare-tags[pedagogy selftaught group]

@lesson[#:title "Introduction to Racket and Numbers"
        #:duration "15 minutes"
        ]{ 
          @bitmap{images/1.1.png}
  @itemlist/splicing[
   @item{The shape to the right is more than just a circle: for now it's also a computer! We need to program it to do things, but once we do, we can use it to try out all of our programs.}
   @item{Right now we can’t put anything in our circle, because our language has nothing in it-we don't know what data types Racket will accept. Let’s add some:
         @(language-table (list "Number" @code{+ - * / sq sqrt expt}))}
   @item{Now we have numbers, which we can put in our Circle of Evaluation.}
   @item{If the number 4 is placed in the center, what is the value of everything in the circle? @tag[selftaught]{Try other numbers, like 1.5, 10345017, and -2.} @bitmap{images/1.3.png}}
   @item{Let's ask a real computer. Throughout this course, you will be using @hyperlink["http://www.wescheme.org" "WeScheme"], a web-based interface for the Racket programming language.}
   @item{@embedded-wescheme[#:id "Intro to Racket and Numbers"
                            #:definitions-text "; try typing in numbers and functions to see what happens"]}
   @item{On your screens you'll notice two large boxes: the Definitions window at the top and the Interactions window at the bottom. For now, we're going to just focus on the Interactions window.}
   @item{The Interactions window is like scrap paper, where you can write short programs and try them out by hitting "Return." When you know what you want to keep as part of your finished product, you write that code up in the Definitions window. Look on the top of the window: you'll see a button with a green man running. What do you think happens when you click "Run"?}
   @item{Whenever you run a Racket program, it computes the program you've written - just like our circle. }
   @item{Type in the number 4, hit Run to see if the computer agrees with you. Congratulations: you just wrote your very first Racket program, and it came out to be the same value as what you'd expected! Try typing in other numbers and see what happens. What happens if you write a decimal? @bitmap{images/1.4.png}}
   @item{In English we have things like nouns and verbs. What's the difference between them? In Racket, anything that is a value is like a noun. I can give Racket the number 5 and it will give it right back, unchanged. All of the numbers you've entered are examples of values.}
   @item{Racket also has things that are like verbs, called Functions. I can throw a marker, the same way I can add two numbers. }
   @item{You already wrote programs that were just values. Now you're going to write programs that apply functions to those values.}
   
            ]
        }
