#lang curr/lib

@declare-tags[pedagogy selftaught]

@lesson[#:title "Simple Ideas, Easter Eggs, and Advanced Challenges"]{

@itemlist/splicing[
                   @item{Diagonal movement keys, second set of faster movement keys, etc.}
                    @item{Player disappears and reappears using some key with (- 10000 y) in update-player, or a real cond to be safer.}
                    @item{Bounding-box collide for oblong characters: if your characters are nowhere near circular, you may want to change to a bounding box version of @code{collide?}
, where line-length in x isn't too big and line length in y isn't too big, separately, with different definitions of too-big for the two dimensions.}
                    @item{You can make multiple Dangers or Targets by defining a list of them. Introduce students to Racket's @code{(list ...)}
 by making a list of two copies of the current target for them. Two will appear onscreen!}
                    @item{The @code{(random upper-bound)}
 function can be used for random speeds, random delta-y with constant delta-x (or vice versa), for "t" meaning "teleport to a random spot on screen" in update-player, etc.}
                    @item{Get the target or danger to slow down as it comes across the screen by making its speed depend on x.}
                    @item{There is a global Number @code{*score*} -- make the speed or the collision radius or something depend on that.}
                    @item{There are global Numbers @code{*player-x*}
 and @code{*player-y*}. Heat seeking Danger. Avoiding Target. Best to use with random or the game gets too hard.}
                    @item{Make update-player check onscreen?-ness of the new position -- wants @code{let}
 to avoid calling update-player-helper twice, but can't have it because of student language, interacts badly with some random stuff for that reason}
                    @item{Black holes: put black spots on the background image and use distance inside onscreen to check that you're not too close to one of these. fix update-player too maybe.}
                    @item{Walls: put walls on the background and make update-player respect them.}
                    @item{Safe Zone: put a green box or green shading somewhere on the background. Change @code{collide?}
 so that if you're in it, you never collide.}
                    @item{Make the player move diagonally towards or away from center: hard!}
                    @item{Get the target or danger to move in a sine wave pattern (hard! have to play with amplitude and keep track of the y offset -- sine is in degrees (though sin is in radians) so the phase should be okay.)}
                ]}