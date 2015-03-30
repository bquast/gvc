# test_block_matrix.R

# load the package
library(gvc)

# create a matrix with content
m <- matrix(1, nrow=12, ncol=12)

m <- block_matrix(m, 3)


# define context
context("output format")

test_that("output size matches", {
  expect_equal( length(m),144 )
  expect_equal( dim(m), c(12, 12) )
  expect_equal( m[1,1], 1)
  expect_equal( m[4,4], 1)
  expect_equal( m[12,12], 1)
  expect_equal( m[1,4], 0)
  expect_equal( m[4,1], 0)
})
