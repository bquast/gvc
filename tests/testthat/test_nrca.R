# test_nrca.R

# load the decompr package
library(decompr)

# load the example data set
data(leather)

# create a leontief decomposed data set
l <- decomp(inter,
            final,
            countries,
            industries,
            out)

# load the package
library(gvc)

# apply the Exporting to Re-export
lnrca <- nrca( l )

# define context
context("output format")

test_that("output size matches", {
  expect_equal( length(lnrca), 9 )
})

test_that("output values match", {
  expect_equal( lnrca[1], 1.2676927, tolerance = .002)
  expect_equal( lnrca[9], 1.9843574, tolerance = .002)
})