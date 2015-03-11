#' Vertical Specialisation
#' 
#' @name vertical_specialisation
#' @param x A Leontief decomposed Inter-Country Input Output table as created by decompr
#' @export

vertical_specialisation <- function( x ) {
  
  # read attributes
  k      <- attr(x, "k")
  i      <- attr(x, "i")
  # rownam <- attr(x, "rownam")
  G <- length(k)
  N <- length(i)
  
    # remove exports to self
  f <- colSums (minus_block_matrix( x, N ) )
  
  f <- as.data.frame(f)
  # rownames(f) <- rownam
  names(f) <- "vertical_specialisation"
  
  return(f)
  
}