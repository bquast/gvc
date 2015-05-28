gvc
--------------
[![Travis-CI Build Status](https://travis-ci.org/bquast/gvc.png?branch=master)](https://travis-ci.org/bquast/gvc)
[![Coverage Status](https://coveralls.io/repos/bquast/gvc/badge.svg)](https://coveralls.io/r/bquast/gvc)


## Installation
The gvc package is available on CRAN, please note that this is a beta version, the API will change.

      install.packages("gvc")

Additionally the development version, to be used **at your own peril**, is available from [GitHub](https://github.com/bquast/gvc).
Installation from GitHub is done using:


      if (!require('devtools')) install.packages('devtools')
      devtools::install_github("bquast/gvc")


Following installation, the package can be loaded using:

    library(gvc)


For information on using the package, please refer to the help files    .

    help("gvc")
    help(package = "gvc")
    
For examples of usage, see the function specific help pages

    help("i2e")
    help("e2r")
    help("nrca")

In addition to the help files we provide long form examples in the **vignettes** .

    vignette("gvc")

    # or
    browseVignettes("gvc")
    
An overview of the changes is available in the NEWS file.

    news(package="gvc")

There is also a blog post with information on my [personal website](http://qua.st/).

 - http://qua.st/gvc/
 

Development
-------------
Development takes place on the GitHub page.

 - http://github.com/bquast/gvc

Bugs can be filed on the issues page on GitHub.

 - https://github.com/bquast/gvc/issues

TODO
-------------

 * [x] `ffddva()`
 * [x] `dfdfva()`
 * [x] `nrca()`
 * [ ] `rei()`
 * [ ] `vax()`


