This is the repository for Bootstrap curriculum and the software
infrastructure that generates notes, handouts, workbooks, and other
educational materials from the curriculum.

----------------------------------------------------------------------

# Licenses

The curriculum is licensed under a Creative Commons 4.0 Unported
License (type
[CC BY-NC-ND](https://creativecommons.org/licenses/by-nc-nd/4.0/
"Terms")). Based on a work at www.BootstrapWorld.org.

The software infrastructure is licensed under a Creative Commons 4.0
Unported license (type
[CC BY-NC-SA](https://creativecommons.org/licenses/by-nc-sa/4.0/ "Terms"))

Permissions beyond the scope of these licenses may be available by
contacting schanzer@bootstrapworld.org. 

----------------------------------------------------------------------

# Installation

1.  Set up curr as a Racket collection.

    Go to the parent directory of curr, and do the following:

    $ raco link curr


2.  Run build.rkt to generate the curriculum.  You can do this either
at the command line, or from DrRacket.

    $ racket build-workbook.rkt
    $ racket build.rkt

    The first command is only needed the first time you build;
    subsequent builds can just use `racket build.rkt`

----------------------------------------------------------------------

# Contributors

Bootstrap builds on the
[Scribble](https://docs.racket-lang.org/scribble/) infrastructure
developed by Matthew Flatt and Eli Barzilay as part of the PLT
project.

## Current Maintainers:
- Kathi Fisler 
- Emmanuel Schanzer 
- Emma Youndtsmith 
- Joe Politz 
- Shriram Krishnamurthi

## Major past contributers:
- Danny Yoo
- Rosanna Sobota

## Other past contributers:
- Vicki Crosson 
- Miles Eldon
- Daniel Kocoj
- Katherine Ng 
- Mike Rowland
- Jonah Stanley 
- Andrew Tian 
- Winnie Wang




