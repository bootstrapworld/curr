#lang curr/lib
@declare-tags[group pedagogy selftaught]
@lesson[#:title "Strings"
        #:duration "10 minutes"]{
@itemlist/splicing[@item{One of the following does not belong. Can you find it? 6, "cat", 0, -2, 7.5}
           @item{Why doesn't "cat" belong? Why isn't 7.5 the odd one out? Or -2? @pedagogy{Circle "cat"}}
           @item{What you have all stumbled onto is that not all values are the same. Some of them are Numbers and some are words.}
           @item{Words like "cat" are called Strings. A String is anything in quotation marks. 5 is not the same as "5"! The first is a number, and the second is a string.}
           @item{You'll notice that our math functions don't really work on Strings.}
           @item{What does it mean to add three and the word "cat"? It doesn't make sense, does it?}
           @item{To create a Number in Racket, we just typed it in. To create a String, you type in the word or words that you want, and put quotation marks on either side.
                 @tag[group]{With your partner:} Try creating a few strings on your own. 
                 @tag[selftaught]{@embedded-wescheme[#:id "Strings"
                   #:interactions-text ";Enter some strings!"
                   #:hide-definitions? #t]}}
           @item{Racket also gives us functions we can use to work with Strings. For example, there's a function called string-length. What do you think it does? I'll give you one hint: the contract.
                 @pedagogy{Write the contract on the board, but without the labels Name, Domain, and Range:}
                 @tag[selftaught]{@think-about[#:question "Try to write the contract for string-length and check below."
                                              #:answer @code{; string-length: String -> Number}]}
                 @pedagogy{@code[#:contract "string-length: String -> Number"]}}
           @item{@think-about[#:question "What is the domain of this function? What is the range?"
                               #:answer "The domain is Strings, and the range is Numbers"]}
           @pedagogy{@item{Now that the students have written down the contract, let them turn on their monitors and experiment, see if they can figure out what string-length does!}}
           @tag[selftaught]{@item{Now that you have written out the contract, turn on your monitor and see if you can figure out what string-length does!}}]}