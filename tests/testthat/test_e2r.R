# test_e2r.R

# load the decompr package
library(decompr)

# load the example data set
data(leather)

# create a leontief decomposed data set
l <- decomp(x = inter,
            y = final,
            k = countries,
            i = industries,
            o = out)

# load the package
library(gvc)

# apply the Exporting to Re-export
le2r <- e2r( l )

# define context
context("output format")

test_that("output size matches", {
  expect_equal( dim(le2r), c(9, 3) )
})

test_that("output order matches", {
  expect_equal( le2r[1,1], factor(c("Argentina", "Turkey", "Germany"))[1] )
  expect_equal( le2r[4,1], factor(c("Argentina", "Turkey", "Germany"))[2])
  expect_equal( le2r[9,1], factor(c("Argentina", "Turkey", "Germany"))[3])
})

test_that("output values match", {
  expect_equal( le2r[1,3], 11.9471938, tolerance = .002)
  expect_equal( le2r[9,3], 4.9233020, tolerance = .002)
})