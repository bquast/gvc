gvc
--------------
[![License](http://img.shields.io/badge/license-GPLv3-brightgreen.svg?style=flat)](http://www.gnu.org/licenses/gpl-3.0.html)
[![CRAN Version](http://www.r-pkg.org/badges/version/gvc)](https://cran.r-project.org/package=gvc)
[![Total RStudio Cloud Downloads](http://cranlogs.r-pkg.org/badges/grand-total/gvc?color=brightgreen)](https://cran.rstudio.com/package=gvc)
[![Montly RStudio Cloud Downloads](http://cranlogs.r-pkg.org/badges/gvc?color=brightgreen)](https://cran.rstudio.com/package=gvc)
[![Travis-CI Build Status](https://travis-ci.org/bquast/gvc.png?branch=master)](https://travis-ci.org/bquast/gvc)
[![Coverage Status](https://coveralls.io/repos/bquast/gvc/badge.svg)](https://coveralls.io/r/bquast/gvc)

Several tools for Global Value Chain ('GVC') analysis are implemented

- 'Importing to Export' (`i2e()`)
- 'Exporting to Re-export' (`e2r()`)
- 'New Revealed Comparative Advantage' (`nrca()`)
- 'Upsteamness' (`upstream()`)
- 'Downstreamness' (`downstream()`)
- 'Domestic Final Demand Foreign Value Added' (`dfdfva()`)
- 'Foreign Final Demand Domestic Value Added' (`ffddva()`)
- 'Domestic Final Demand Domestic Value Added' (`dfddva()`)


Installation
--------------
The gvc package is available on [CRAN](https://cran.rstudio.com/package=gvc), please note that this is a beta version, the API will change.

```r
install.packages("gvc")
```

Additionally the development version, to be used **at your own peril**, is available from [GitHub](https://github.com/bquast/gvc).
Installation from GitHub is done using:

```r
if (!require('devtools')) install.packages('devtools')
devtools::install_github("bquast/gvc")
```


Usage
----------
Following installation, the package can be loaded using:

```r
library(gvc)
```

For information on using the package, please refer to the help files.

```r
help("gvc")
help(package = "gvc")
```
    
For examples of usage, see the function specific help pages.

```r
help("i2e")
help("e2r")
help("nrca")
help("upsteam")
help("downstream")
help("dfdfva")
help("ffddva")
help("dfddva")
```

In addition to the help files we provide long form examples in the [vignette](http://cran.r-project.org/web/packages/gvc/vignettes/gvc.html).

```r
vignette("gvc")

# or
browseVignettes("gvc")
```


Additional Information
-----------------------
An overview of the changes is available in the NEWS file.

```r
news(package="gvc")
```

There is also a blog post with information on my [personal website](http://qua.st/).

http://qua.st/gvc/

This package relies on the [diagonals package](http://qua.st/diagonals) ([CRAN](http:cran.r-project.org/packge=diagonals)).


Development
-------------
Development takes place on the GitHub page.

http://github.com/bquast/gvc

Bugs can be filed on the GitHub issues page.

https://github.com/bquast/gvc/issues.


TODO
-------------

 * [x] `nrca()`
 * [ ] `rei()`
 * [ ] `vax()`
