#lang curr/lib

@(design-recipe-exercise "collide?" (list "Write a function collide?, which takes FOUR inputs:"
@(itemlist @(item "px: The x-coordinate of the player")
           @(item "py: The y-coordinate of the player")
           @(item "cx: the x-coordinate of another game character")
           @(item "cy: the y-coordinate of another game character"))
"It should return true if the coordinates of the player are within 50 pixels of the coordinates of the other character. Otherwise, false.")
                         #:num-examples 2
                         )