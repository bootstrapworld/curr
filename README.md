This is the repository for Bootstrap 1 materials.

Contributors:

The following contributors worked on converting this material in the
summer of 2012 at Brown University:

  Daniel Kocoj
  Mike Rowland
  Winnie Wang
  Kathi Fisler
  Jonah Stanley
  Miles Eldon
  Andrew Tian
  Katherine Ng


After the summer, this codebase has been maintained by:

  Emmanuel Schanzer
  Kathi Fisler
  Vicki Crosson
  Emma Youndtsmith



----------------------------------------------------------------------

Installation:

1.  Set up curr as a Racket collection.

    Go to the parent directory of curr, and do the following:

    $ raco link curr


2.  Run build.rkt to generate the curriculum.  You can do this either
at the command line, or from DrRacket.

    $ racket build-workbook.rkt
    $ racket build.rkt

    The first command is only needed the first time you build;
    subsequent builds can just use `racket build.rkt`

    To generate the curriculum under a different tagging context,
    provide additional arguments to the build.rkt program.  e.g:

    $ racket build.rkt pedagogy group

    Under DrRacket, you can change your Language settings to include
    the tags as custom command line arguments.

