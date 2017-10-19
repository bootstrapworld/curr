#lang curr/lib

@title{Your own Drawing Functions}

@unit-overview/auto[#:lang-table (list (list "Number" @code{+ - * / sqr sqrt expt} "1 ,4 ,44.6") 
                                       (list "String" @code{string-append string-length} " \"hello\" ")                          
                                       (list "Image" @code{rectangle circle triangle ellipse star scale rotate put-image} "(circle 25 \"solid\" \"red\")")
                                       )]{

@unit-descr{Starting with a bare-bones reactor, students brainstorm possible animations, and write their own draw-state functions}
}
@unit-lessons{
@lesson/studteach[#:title "draw-state for a Single Number"
        #:duration "30 minutes"
        #:overview "Students explore the different animations they can create using a single number"
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students write the draw-state function for a reactor using a single number}]
        #:standards (list "BS-M" "BS-IDE" "BS-PL.1" "BS-PL.4" "BS-DR.4" "BS-R")
        #:materials @itemlist[@item{}]
        #:preparation @itemlist[@item{Make sure students have completed units 1 through 3 before starting this lesson.}
                                @item{The @editor-link[#:public-id "0B9rKDmABYlJVSFRPYWlsajJ1SmM" "Blank Single Number draw-state"] file preloaded on student machines}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
       @points[
        @point{@student{The majority of reactive programs you'll write in this course will use data structures consisting of multiple pieces of data, whether that be Numbers, Strings, Images, or Booleans. However, it's not @italic{required} to have a full data structure in order to use a reactor. In fact, we can create an animation based on just a single number!}
                @teacher{}}

         @point{@student{@activity{Open the @editor-link[#:public-id "0B9rKDmABYlJVSFRPYWlsajJ1SmM" "Blank Single Number draw-state"] file and take a look at the code. Before hitting 'Run', can you guess what this code will do?}

@code[#:multi-line #t]{
include image
include reactors

# next-state-tick: Number -> Number
fun next-state-tick(n):
  n + 1
end

# draw-state: Number -> Image
fun draw-state(n):
  
  "fix me!"
  
end

num-react = reactor:
  init: 1, 
  # to-draw: draw-state,
  on-tick: next-state-tick
end

interact(num-react)
}}
                 @teacher{}}

         @point{@student{Notice how there is no @code{data} block in this file. Both the @code{next-state-tick} and the @code{draw-state} function consume a single number, and the initial value given to the reactor is also a single number (in this case, 1.) @activity{Click 'Run'. What do you see?}}
                 @teacher{}}

         @point{@student{Accordingto the @code{next-state-tick} function, on every clock tick the state (a single number) will increase by one, which is exactly what happens. Since we didn't tell the reactor how to draw the state (the @code{to-draw} part of the reactor is commented out), when the reactor runs we see the state of the reactor (a single number) increasing, instead of an animation. @activity{What do you think would happen if we had a reactor with a complete @code{draw-state} function, but a @code{next-state-tick} function that never updated the state? (Consuming and producing the same value.)}}
                 @teacher{Reinforce the fact that, although the @code{draw-state} and @code{next-state-tick} functions work together within a reactor to produce an animation, each function can work without the other. In this example, @code{next-state-tick} will update the state even without a function to draw the state.}}

         @point{@student{There are much more interesting things we can display using a number as the state of the reactor, however! @activity{Change the @code{draw-state} function so that it consumes a Number and produces an image. Then, uncomment the @code{to-draw: draw-state} line in the reactor to see an animation when the program runs!}}
                @teacher{Encourage students to brainstorm and share ideas for the @code{draw-state} function before beginning. Some possible options include: @itemlist[@item{Drawing a star of size @code{n} (so that it gets larger on each tick)}
                           @item{Display @code{n} as an image using the @code{text} function.}]
                         Have students share back the @code{draw-state} functions they wrote.}}
                   ]}

@lesson/studteach[#:title "draw-state for Two Numbers"
        #:duration "30 minutes"
        #:overview "Students explore the different animations they can create using a state consisting of two numbers"
        #:learning-objectives @itemlist[]
        #:evidence-statements @itemlist[]
        #:product-outcomes @itemlist[@item{Students write the draw-state function for a reactor using a state containing two numbers}]
        #:standards (list "BS-M" "BS-IDE" "BS-PL.1" "BS-PL.4" "BS-DR.4" "BS-R")
        #:materials @itemlist[@item{}]
        #:preparation @itemlist[@item{Make sure students have completed units 1 through 3 before starting this lesson.}
                                @item{The @editor-link[#:public-id "0B9rKDmABYlJVcTZ1WTdReUxTMTA" "Blank 2 Number draw-state"] file preloaded on student machines}]
        #:pacings (list 
                @pacing[#:type "remediation"]{@itemlist[@item{}]}
                @pacing[#:type "misconception"]{@itemlist[@item{}]}
                @pacing[#:type "challenge"]{@itemlist[@item{}]}
                )
      ]{
       @points[
        @point{@student{You've practiced writing a @code{draw-state} function using a single number as a state, now let's look at something a bit more familiar. @activity{Open the @editor-link[#:public-id "0B9rKDmABYlJVcTZ1WTdReUxTMTA" "Blank 2 Number draw-state"] file and take a look at the code.}}
                @teacher{}}
         
        @point{@student{ @code[#:multi-line #t]{include image 
include reactors 

data AnimationState:
  | state(
      a :: Number,
      b :: Number)
end

START = state(1, 100)

# next-state-tick: AnimationState -> AnimationState
fun next-state-tick(s):
  state(s.a + 1, s.b - 1)
end

# draw-state: AnimationState -> Image
fun draw-state(s):

  "fix me!"
  
end


state-react = reactor:
  init: START,
# to-draw: draw-state,
  on-tick: next-state-tick
end

interact(state-react)}
                         This code includes a data structure (called @code{AnimationState}) containing two numbers as its fields, @code{a} and @code{b}. As before, the @code{draw-state} function is incomplete, and commented out from the reactor. @activity{Based on the @code{next-state-tick} function defined here, what do you think will happen when you hit 'Run'? Discuss with your partner, then try it out!}}
                @teacher{}}

        @point{@student{With only the @code{next-state-tick} function, we can see the state updating, increasing the first number by 1 and decreasing the second number by 1 each tick. @activity{How could you define a @code{draw-state} function to show something interesting when the program runs? Branstorm with your partner, then change the existing, broken @code{draw-state} function to consume an @code{AnimationState} and produce an image. Then, comment out the @code{to-draw: draw-state} line in the reactor to see an animation when the program runs!}}
                @teacher{Some possible ideas for this activity: @itemlist[@item{Display two shapes of size @code{a} and @code{b}, which get larger and smaller, respectively, as the reactor runs.}
                                                                          @item{Make @code{a} and @code{b} the coordinates of an image, moving down and to the right across a background as the reactor runs.}]
                         Have students share back what they brainstormed before beginning, then share the completed @code{draw-state} functions they wrote, and the animations they created!}}


]}}
