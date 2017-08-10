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

1.  You'll need to install (http://www.racket-lang.org "DrRacket v6.10+") 
and (https://wkhtmltopdf.org/ "wkhtmltopdf") first, before cloning the `curr`
repository.

2.  Then set up `curr` as a Racket collection.

    Go to the parent directory of `curr`, and do the following:

    `$ raco link curr`


3.  Generate the curriculum.

    `$ ./build-distrib-no-pdf`


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
- Sam Dooman

## Other past contributers:
- Vicki Crosson 
- Miles Eldon
- Daniel Kocoj
- Katherine Ng 
- Mike Rowland
- Jonah Stanley 
- Andrew Tian 
- Winnie Wang




