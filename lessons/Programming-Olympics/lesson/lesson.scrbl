#lang curr/lib

@declare-tags[pedagogy selftaught]

@lesson[#:title "Programming Olympics!"]{
                                  @itemlist/splicing[
                                         @item{Divide the class into groups of roughly six students each. This can be done by gender, by grade, at random, or by any other criteria you see fit. However, it is important that both teams have similar mixes of strong and struggling students.}
                                         @item{Explain that these teams will be entering in the Scheme Olympics, a veritable programming decathlon where teams must submit entries for various events. The rules are as follows:
                                               @itemlist/splicing[
                                                                   @item{Every student on a team must participate in at least one event.}
                                                                   @item{Once a student has signed up for an event, they may not switch.}
                                                                   @item{All correct answers are worth one point, and points will only be deducted for violations of the rules.}
                                                                   @item{Any notes taken during the semester may be used by the student who took those notes.}
                                                                  ]}
                                         @item{Display a visual, which outlines the major events of the Scheme Olympics. These events can be decided by the instructor, but a number of ideas are listed below:
                                               @itemlist/splicing[
                                                                  @item{Guess that Contract: students are given a function, and asked to guess the contract for that function. (Stresses the importance of naming, note-taking, and reviews basic data types.)}
                                                                  @item{Find the Bug: students are given examples of buggy code, which can be drawn from the exercises in earlier lessons or from real examples of mistakes your students have made during the semester. Students must identify the bug and fix it for an additional point.} 
                                                                  @item{Design Recipe Relay: a true team event, in which students are given a problem statement, and the first competitors must successfully deduce the contract. The students then have a contract and purpose statement over to the next competitors on their team, who must devise to test cases for the functions to be written. Finally, this information is headed to the last set of competitors, who must write a function that satisfies the contract and passes all tests cases.}
                                                                  @item{Code Whispering: students are shown a strange function, with no contract or purpose statement and gibberish for both the function name and variable names. Students must figure out first what the name of the function is, then how many inputs it takes, then what types of those inputs are based on how they are used in the body of the function. Each one of these answers can be valued at one point. Finally, students must explain what the function does, suggest a new name, and use the function in an example to demonstrate their correctness.}
                                                                  @item{Fill in the blank: students are given functions and their contracts, but some part of the function is missing. Compete, Jeopardy-style, for who can fill in the parts fastest.}]}]}
                                               
                                               
                                