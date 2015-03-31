# gvc
[![Travis-CI Build Status](https://travis-ci.org/bquast/gvc.png?branch=master)](https://travis-ci.org/bquast/gvc)
[![Coverage Status](https://coveralls.io/repos/bquast/gvc/badge.svg)](https://coveralls.io/r/bquast/gvc)
[![DOI](https://zenodo.org/badge/4012/bquast/gvc.svg)](http://dx.doi.org/10.5281/zenodo.16506)

Global Value Chain tools in R. This package is in a **very early stage of development**.

## Installation
The gvc package is available on CRAN, please note that this is a beta version, the API will change.

```r
install.packages("gvc")
```

Additionally the development version is available from GitHub. Installation from GitHub is done using

```r
if (!require('devtools')) install.packages('devtools')
devtools::install_github("bquast/gvc")
```

## Usage

```r
library(gvc)

# built in help files

# revealed comparative advantage
help("rca")

# vertical specialisation
help("vertical_specialisation")
# also available as vertical_specialization (with a z)

# new revealed comparative advantage (WWZ)
help("nrca")
```

## TODO

 * [ ] rei
 * [ ] vax


