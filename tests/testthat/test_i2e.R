# test_i2e.R

# load the decompr package
library(decompr)

# load the example data set
data(leather)
attach(leather)

# create a leontief decomposed data set
l <- decomp(x = inter,
            y = final,
            k = countries,
            i = industries,
            o = out)

# load the package
library(gvc)

# apply the Importing to Export 
li2e <- i2e( l )

# define context
context("output format")

test_that("output size matches", {
  expect_equal( dim(li2e), c(9, 3) )
})

test_that("output values match", {
  expect_equal( li2e[1,3], 3.404712, tolerance = .002)
  expect_equal( li2e[9,3], 25.397173, tolerance = .002)
})