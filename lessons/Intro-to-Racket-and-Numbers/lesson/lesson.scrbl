#lang curr/lib

@declare-tags[pedagogy selftaught group]

@lesson[#:title "Introduction to Racket and Numbers"
        #:duration "15 minutes"
        ]{ 
  @itemlist/splicing[
   @tag[pedagogy]{@item{Draw a big Circle on the board.}}
   @item{This circle is going to be our computer! We need to program it to do things, but once we do, we can use it to try out all of our programs.}
   @item{Look at our language table: right now we can't put anything in our circle, because our language has nothing in it. Let's add some values.}
   @tag[pedagogy]{@item{On three, Let there be numbers! "1... 2... 3... Let there be numbers!"}}
   @item{Add "numbers" to the Types section of the language table.}
   @item{Now we have numbers, which we can put in our Circle of Evaluation. (Put in the number 4.) What is the value of everything in this circle? Are you sure? @tag[pedagogy]{(Try other numbers, including decimals and negative numbers.)} @tag[selftaught]{Try other numbers, like 1.5, 10345017, and -2.}}
   @item{Let's ask a real computer...}
   @tag[pedagogy]{@item{Have the students look at the editor on their computers. Refer to overhead projector as necessary.}}
   @item{@embedded-wescheme[#:id "Intro to Racket and Numbers"
                            #:definitions-text "; try typing in numbers and functions to see what happens"]}

   @item{This is a tool that allows you to write Racket programs. On your screens you'll notice two large boxes: the Definitions window at the top and the Interactions window at the bottom. For now, we're going to just focus on the Interactions window.}
   @item{The Interactions window is like scrap paper, where you can write short programs and try them out by hitting "Return." When you know what you want to keep as part of your finished product, you write that code up in the Definitions window. Look on the top of the window: you'll see a button with a green man running. What do you think happens when you click "Run"?}
   @item{Whenever you run a Racket program, it computes the program you've written - just like our circle. }
   @item{Type in the number 4, hit Run to see if the computer agrees with you. Congratulations: you just wrote your very first Racket program, and it came out to be the same value as what you'd expected! Try typing in other numbers and see what happens. What happens if you write a decimal?}
   @item{In English we have things like nouns and verbs. What's the difference between them? In Racket, anything that is a value is like a noun. I can give Racket the number 5 and it will give it right back, unchanged. All of the numbers you've entered are examples of values.}
   @item{Racket also has things that are like verbs, called Functions. I can throw a marker, the same way I can add two numbers. }
   @item{You already wrote programs that were just values. Now you're going to write programs that apply functions to those values.}
   
            ]
        }
