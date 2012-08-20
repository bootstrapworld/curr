#lang curr/lib

@declare-tags[pedagogy selftaught group]

@lesson[#:title "Intro to Racket and Numbers"
        #:duration "15 minutes"
        ]{ 
  @itemlist/splicing[
   @item{Okay, it's time to start learning this new programming language!}
   @pedagogy{@item{Have the students look at the editor on their computers. Refer to overhead projector as necessary.}}
   @item{This is a tool that allows you to write Racket programs. On your screens you'll notice two large boxes: the Definitions window at the top and the Interactions window at the bottom. For now, we're going to just focus on the Interactions window.}
   @item{The Interactions window is like scrap paper, where you can write short programs and try them out by hitting "Return." When you know what you want to keep as part of your finished product, you write that code up in the Definitions window.}
   @pedagogy{@item{Draw students' attention to the Language Table (see Lesson Overview for Unit 1), which currently sits empty.}}
   @item{At the very least, our language should have Numbers in it. @pedagogy{On three, Let there be numbers! "1... 2... 3... Let there be numbers!"}}
   @item{Add "numbers" to the Types section of the language table.}
   @tag[selftaught]{@item{@embedded-wescheme[#:id "Intro to Racket and Numbers"
                            #:definitions-text "; try typing in numbers and functions to see what happens"]}}

   @item{Whenever you run a Racket program, it computes the program you've written. Since we have Numbers in our language, we should be able to write @italic{really simple} programs, like @code{4}. That's right -- a Number by itself is a program! Maybe not a very exciting one, but a program nonetheless. What do you think @code{4} will evaluate to when we run it?}
   @item{Type in the number 4 into the Interactions window, and hit Return to see if the computer agrees with you. Congratulations: you just wrote your very first Racket program, and it came out to be the same value as what you'd expected! Try typing in other numbers and see what happens. What happens if you write a decimal? @bitmap{images/1.4.png}}
   @item{@pedagogy{(Try other numbers, including decimals and negative numbers.)} @tag[selftaught]{Try other numbers, like 1.5, 10345017, and -2.}}
   @item{In English we have things like nouns and verbs. What's the difference between them? In Racket, anything that is a value is like a noun. I can give Racket the number 5 and it will give it right back, unchanged. All of the numbers you've entered are examples of values.}
   @item{Racket also has things that are like verbs, called Functions. I can @code{throw} a marker, the same way I can @code{add} two numbers. }
   @item{You already wrote programs that were just values. Now you're going to write programs that apply functions to those values.}
            ]
        }
