#lang curr/lib

@itemlist[
         @item{@think-about[#:question "Suppose you want to cook a meal. What would be the contract for cook-meal? Remember that to make a meal, you need the correct ingredients, the correct tools, and you have to choose what you want to make. 
First, describe the domain and range of cook-meal. Next, write a contract for the cook-meal procedure."
                           #:answer ";cook-meal : Ingredients Tools Selection -> Food"]} 
          @item{@think-about[#:question "Suppose you have a quarter, but you want your friend's quarter. When he isn't looking, you quickly swap your quarter with your friend's quarter. What is the contract for swap-quarter? What is the domain and range? Remember that contracts show the TYPE of input and outputs, but NOT the actual input or output. "
                           #:answer ";swap-quarter : Quarter -> Quarter"]} 
          @item{@think-about[#:question "A TV channel asks you to enter the genre of your favorite movie, and then shows a movie title from the genre and the year it was made. What are the domain and range? What is the contract for movie-info?"
                             #:answer ";movie-info : Genre -> Title Year"]} 
          
          #:style 'ordered
          ]
         


