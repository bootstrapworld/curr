This is the repository for Bootstrap 1 materials.
Daniel Kocoj
Mike Rowland
Winnie Wang
Kathi Fisler
Jonah Stanley
Miles Eldon
Andrew Tian




To convert the HTML files to PDF, we can use wkhtmltopdf:

    http://code.google.com/p/wkhtmltopdf/



----------------------------------------------------------------------

Installation:

1.  Set up curr as a Racket collection.

    Go to the parent directory of curr, and do the following:

    $ raco link curr

2.  Ensure that Racket and Scribble are in your path.

    $ which racket
    $ which curr

    Both of these should report the locations of those binaries.

3.  Run build.rkt to generate the curriculum.

    $ racket build.rkt


    To generate the curriculum under a different tagging context,
    provide additional arguments to the build.rkt program.  e.g:

    $ racket build.rkt pedagogy group



