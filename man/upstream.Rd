% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/upstream.R
\name{upstream}
\alias{upstream}
\title{Upstreamness}
\usage{
upstream(x)
}
\arguments{
\item{x}{an object of class "decompr" as created using the load_tables_vectors() function from the decompr package.}
}
\description{
Upstreamness
}
\examples{
# load the decompr package
library(decompr)

# load example data
data(leather)
attach(leather)

# create a leontief decomposed data set
l <- load_tables_vectors(x = inter,
                         y = final,
                         k = countries,
                         i = industries,
                         o = out        )
 
 # apply upstream
 upstream( l )
}
