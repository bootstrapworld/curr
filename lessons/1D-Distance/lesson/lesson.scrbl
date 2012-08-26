#lang curr/lib

@declare-tags[group pedagogy selftaught bootstrap]
@lesson[#:title "1D Distance" 
        #:duration "5 minutes"
        #:prerequisites "Cond-Example-With-Pizza-Toppings"]{
        @itemlist/splicing[@item{If all we did was subtract the second number from the first, the function would only work half the time! Suppose your target is standing at 20, and the player is at 10. What is 20 minus 10? What if their positions were reversed?}
                            @item{The important thing to notice here is that @code{line-length} is doing something special. It's subtracting the little number from the big one, @italic{no matter which number comes first!}}
                            @item{In your game files, scroll down until you can see the code for @code{line-length}.}
                            @item{Why do you think it has to use @code{cond}? @italic{Because it needs to check which number is bigger before it subtracts!}}
                            @pedagogy{@item{Have students work through a few examples of this}}            
                            @item{Now look at the definition of @code{*distances-color*} Currently it's just the empty string: @code{""}. Try changing it to a real color, like @code{"black"} or @code{"white"} or @code{"magenta"}.
                                                                @;FILEALTERATIVE
                                                                }
                            @item{When you click Run, you will now see lines representing the x-length, y-length, and distance between the target, danger and player. These numbers come from your line-length function!}
                            @item{Unfortunately, the hypoteneuse of the right triangle is showing up as zero - line-length alone doesn't know how to calculate this distance!}]}