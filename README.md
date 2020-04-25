gvc
--------------
[![License](https://img.shields.io/badge/license-GPLv3-brightgreen.svg?style=flat)](https://www.gnu.org/licenses/gpl-3.0.html)
[![CRAN Version](https://www.r-pkg.org/badges/version/gvc)](https://cran.r-project.org/package=gvc)
[![R build status](https://github.com/bquast/gvc/workflows/R-CMD-check/badge.svg)](https://github.com/bquast/gvc/actions?workflow=R-CMD-check)
[![Coverage Status](https://img.shields.io/codecov/c/github/bquast/gvc/master.svg)](https://codecov.io/bquast/gvc/gvc?branch=master)
[![Total RStudio Cloud Downloads](https://cranlogs.r-pkg.org/badges/grand-total/gvc?color=brightgreen)](https://cran.r-project.org/package=gvc)
[![Montly RStudio Cloud Downloads](https://cranlogs.r-pkg.org/badges/gvc?color=brightgreen)](https://cran.r-project.org/package=gvc)

Several tools for Global Value Chain ('GVC') analysis are implemented

- 'Importing to Export' (`i2e()`)
- 'Exporting to Re-export' (`e2r()`)
- 'New Revealed Comparative Advantage' (`nrca()`)
- 'Upsteamness' (`upstream()`)
- 'Downstreamness' (`downstream()`)
- 'Domestic Final Demand Foreign Value Added' (`dfdfva()`)
- 'Foreign Final Demand Domestic Value Added' (`ffddva()`)
- 'Domestic Final Demand Domestic Value Added' (`dfddva()`)

Demonstration
---------------
![gvc demonstration](https://github.com/bquast/R-demo-GIFs/blob/master/gvc.gif)


Installation
--------------
The gvc package is available on [CRAN](https://cran.r-project.org/package=gvc), please note that this is a beta version, the API will change.

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

In addition to the help files we provide long form examples in the vignette.

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

There is also a blog post with information on my [personal website](https://qua.st/).

https://qua.st/gvc/

This package relies on the [diagonals package](https://qua.st/diagonals) ([CRAN](https://cran.r-project.org/package=diagonals)).


Development
-------------
Development takes place on the GitHub page.

https://github.com/bquast/gvc

Bugs can be filed on the GitHub issues page.

https://github.com/bquast/gvc/issues.


TODO
-------------

 * [x] `nrca()`
 * [ ] `rei()`
 * [ ] `vax()`
