#lang scribble/base
@(require "lib/all.rkt")

@title{Unit 1 Worksheet}

@section{Reverse-Engineering: How Does NinjaCat Work?}
@worksheet{
  @row[#:count 1]{
       Thing in the game...
       What changes about it?
       More specifically...
       }
  @row[#:count 14]{
      @fill-in-the-blank[#:id "thing" #:label "Thing in the game..."]
      @fill-in-the-blank[#:id "changes" #:label "What changes about it?"]
      @fill-in-the-blank[#:id "specifics" #:label "More specifically..."]
      }
  }

@section{Game Parts - NinjaCat!}
@worksheet{
  @fill-in-the-blank[#:id "background" #:label "The background is a picture of:"]
  @fill-in-the-blank[#:id "coordcat" #:label "The coordinates for the PLAYER(NinjaCat) are:"] 
  @fill-in-the-blank[#:id "coorddog" #:label "The coordinates for the DANGER(Dog) are:"] 
  @fill-in-the-blank[#:id "coordruby" #:label "The coordinates for the TARGET(Ruby) are:"]   
}

@section{Our Videogame}
@worksheet{
  Created by (write your names): @fill-in-the-blank[#:id "names" #:label "names"]
  
  Background
  
  Our game takes place: @fill-in-the-blank[#:id "place" #:label "place"]
  (In space? The desert? A mall?)
  
  The Player
  
  The player is a  @fill-in-the-blank[#:id "player" #:label "player"]
  The player moves only up and down.
  
  The Target
  
  Your player GAINS points when they hit the target.
  The target is a  @fill-in-the-blank[#:id "target" #:label "target"]
  The target moves only to the left and right.
  
  The Danger
  
  Your player LOSES points when they hit the danger.
  The danger is a  @fill-in-the-blank[#:id "danger" #:label "danger"]
  
  The danger moves only to the left and right.
}

@section{Circle of Evaluation Practice}
@worksheet{
@(worksheet-table (list "Math" "Circle of Evaluation" "Racket Code")
                  (list "5 x 10" "8 + (5 x 10)" "(8 + 2) - (5 x 10)" "(5 x 10)/(8-2)")
                  (list "ce" "re"))
}