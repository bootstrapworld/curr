#lang curr/lib
@declare-tags[group pedagogy selftaught bootstrap]
@lesson[#:title "Target Movement" #:duration "20 min"]{
@itemlist[@item{We also need to animate our target. Guess what? We need to write another function!}
          @item{How fast should your target move?}
          @item{Which direction?}
          @item{Next on @(hyperlink "page16" "Page 16") is update-target. Using a Design Recipe Worksheet again, complete the design recipe. @tag[pedagogy]{Once again, make sure you come up to the board and write down your example. I will give you the "OK" to start typing.}}]}

@lesson[#:title "Optional: Fun With Movement" #:duration "20 min"]{
@itemlist[@item{Can you make your danger move slower? faster?}
           @item{Can you make your target move the other way? (just to try)}
           @item{It'll break your examples, but there's a function called (random n) that gives you a random number less than n. Can you make your target move with random speed?}]}

@lesson[#:title "Optional: Projectile Movement" #:duration "15 min"]{
@itemlist[@item{@tag[pedagogy]{NOTE FOR INSTRUCTORS: Many teachers find it useful to add projectiles only at the end of the class, as a "treat" for kids. It also tends to help break the "shooting-style" bias that a lot of students have.}}
           @item{@tag[selftaught]{NOTE: You might find it useful to add projectiles only at the end of the class, as it is more of a "treat". It also tends to help break the "shooting-style".}}
           @item{@tag[pedagogy]{If you want to introduce projectiles this early, then go ahead and change mystery and update-mystery near the end of the game to projectile and update-projectile, and move them up to near the danger and target. The space bar triggers projectiles if the updater moves them. Some teachers will want to save this for later in the class, and have students rename the functions themselves.}}
           @item{@tag[selftaught]{If you want to start projectiles this early, then go ahead and change mystery and update-mystery near the end of the game to projectile and update-projectile, and move them up to near the danger and target. The space bar triggers projectiles if the updater moves them. You might want to save this for later in the class. Feel free to rename the functions yourself!}}
           @item{Now we need to animate our projectile. If our dangers are flying in from the left, which way should our projectile fire? To the right!}
           @item{Use another Design Recipe worksheet to animate your projectile! Once again, make sure you write down your examples. @tag[pedagogy]{I will give you the "OK" to start typing.}}
           @item{Scroll to the bottom of the screen, and look for the semicolon before the word "start". Delete that semicolon.}
           @item{If your animation functions are correct, you should see your game start running, and your danger and target will move!}]}