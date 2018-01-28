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

1.  You'll need to install (http://www.racket-lang.org "DrRacket v6.10 or later") 
and (https://github.com/wkhtmltopdf/wkhtmltopdf/releases/0.12.3/ "wkhtmltopdf, version 0.12.3") first, before cloning the `curr`
repository. (Note: the current release of wkhtmltopdf, version 0.12.4 as of this writing, contains a regression that prevents the workbook from printing properly)

2.  Then set up `curr` as a Racket collection.

    Go to the parent directory of `curr`, and do the following:

    `$ raco link curr`


3.  Generate the curriculum.

    `$ ./build-distrib`

By default, this will build every course in every available language in the `/distribution` directory. Note: this can take some time!

If you wish to build only the lesson plans (not the workbook and solutions), you can also use `$ ./build-notes`. Similarly, `$ ./build-workbook` will create the workbook without also building the lesson plans. 

All three of these scripts accept the following arguments: `--language [english|spanish|etc]` and `--course [algebra|reactive|data-science|physics]`


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

## Other contributers:
- Vicki Crosson 
- Miles Eldon
- Daniel Kocoj
- Katherine Ng 
- Mike Rowland
- Jonah Stanley 
- Andrew Tian 
- Winnie Wang
- Eric Allatta
- CoriAnne Burgess