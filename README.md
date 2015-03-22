# gvc
[![Travis-CI Build Status](https://travis-ci.org/bquast/gvc.png?branch=master)](https://travis-ci.org/bquast/gvc) 
Global Value Chain tools in R. This package is in a **very early stage of development**.

## Installation
gvc is currently under development and not available on CRAN. Installation from GitHub is done using

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
