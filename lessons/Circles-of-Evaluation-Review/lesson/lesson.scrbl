#lang curr/lib

@declare-tags[group pedagogy selftaught]
@lesson[#:title "Introduction"
        #:duration "25 minutes"]{
          @itemlist/splicing[@item{Welcome back! Do you remember what we did in the last class?}
           @item{At the end of class, you learned something extremely important: the Circles of Evaluation, and how to write simple programs in Racket.}
           @item{Suppose I have the math expression "2 + 3." How would I draw a circle of evaluation for this? How would I convert this into code?}
           @;add image
           @item{@think-about[#:question "How about \"2 + 3 divided by 1 - 2\"?"
                             #:answer "MAKE A PICTURE!!!!"]}
           @item{Let's do a review challenge:
                 @itemlist/splicing[@item{Turn to @worksheet-link[#:page 6 #:name "Circles-of-Evaluation-Practice-2"] in your workbooks, where it says "Circles Competition." On each row there is a mathematical expression in the first column,
                                 with room to draw the Circle of Evaluation and the Racket Code on the second and third columns.}
                           @item{Each row will be a round for this activity, so for Round 1 we'll just be looking at the first row. For this first row, we've even helped you out a little.}
                           @item{@tag[group]{You will have one minute to do the following in groups:} Draw the Circle
                                  of Evaluation, and then convert it to Racket code. @tag[group]{Everyone must have the answer written down for your group to win points. GO!}}
                           @tag[pedagogy]{@item{During the minute, walk around and see how groups are doing. Comment on good teamwork when you see it. Don't tutor much; let kids fail: they'll get it in review before the next round.
                                                      When time is up (really 1 minute: the idea is to go quickly), give them a countdown: "30... 10... 5... 4... 3... 2... 1... PENCILS DOWN, EYES UP HERE!" Wait for total silence and complete attention.}}
                           @tag[pedagogy]{@item{Review and discuss. Assign points.}}
                           @item{Repeat for each additional round}
                           ]}
           @tag[pedagogy]{@item{Have kids complete the competition - give as little help as possible at this point. After the time is up, have students volunteer their answers. Review as necessary.}}]}