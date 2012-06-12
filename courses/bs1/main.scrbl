#lang curr/lib

@title{BSL}

@(define max-unit-index 9)

@;; Helper function to hyperlink the units
@(define (unit-link n desc)
   @hyperlink[(format "units/unit~a/the-unit.html" n)]{@desc})

@;@(apply itemlist
@;  (for/list ([n (in-range 1 (add1 max-unit-index))])
@;    @item{@unit-link[n]}))

@unit-link[1 "Unit 1 - students break down a simple videogame into its component parts, and explore how cartesian coordinates play a role in animation. They then brainstorm their own videogames, and are introduced to the basics of numerical Racket expressions."]
@unit-link[2 "Unit 2 -  students deepen their understanding of expressions, generalizing across strings and images. They are also introduced to the algebraic concepts of Domain, Range and function composition."]
@unit-link[3 "Unit 3 - students begin to define functions of their own, and create screenshots of their own videogames."]
@unit-link[4 "Unit 4 - students begin to define functions of their own, using the Design Recipe."]
@unit-link[5 "Unit 5 - students combine their understanding of function definitions with their videogame screenshots, this time writing functions to animate their game characters by producing new coordinates."]
@unit-link[6 "Unit 6 - students encounter the concepts of inequality and boolean logic, and write functions that keep a butterfly from flying outside of a box defined by four coordinates. This same code is then used in their own games to keep characters on the screen. "]
@unit-link[7 "Unit 7 - students discover partial functions, and must define them over various domains. They begin by writing code for a pizza place, then practice over images until finally writing code that maps keypresses to changes in game coordinates."]
@unit-link[8 "Unit 8 - students must use function composition and boolean logic to determine whether two characters have collided. Along the way, they must prove the pythagorean theorem and then turn their proof into real code."]
@unit-link[9 "Unit 9 - students complete their games, and design creative posters to advertise their creations. They practice public speaking, presenting their games and posters to each other and walking through their code."]
