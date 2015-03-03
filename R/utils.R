#' Block matrix
#' 
#' @name block_matrix
#' @param x a square matrix
#' @param s the dimensions (width = height) of the block matrix being selected over the diagonal of matrix x
#' @export

block_matrix <- function( x, s ) {
  
  if (!dim(x)[1] == dim(x)[2]) stop("x is not a square matrix")
  
  y <- matrix(0, nrow = length(x), ncol = length(x) )
  
  for (j in 1:s) {
    p <- seq( ((j-1)*s + 1), j*s )
    y[p, p] <- unlist(x[p, p])
  }
  
  return(y)
}

#' Minus Block matrix
#' 
#' @name block_matrix
#' @param x a square matrix
#' @param s the dimensions (width = height) of the block matrix being dropped over the diagonal of matrix x
#' @export

minus_block_matrix <- function( x, s ) {
  
  if (!dim(x)[1] == dim(x)[2]) stop("x is not a square matrix")
  
  for (j in 1:s) {
    p <- seq( ((j-1)*s + 1), j*s )
    x[p, p] <- 0
  }
  
  return(x)
}