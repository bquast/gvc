#' Vertical Specialisation
#' 
#' @name vertical_specialisation
#' @param x A Leontief decomposed Inter-Country Input Output table as created by decompr
#' @export

vertical_specialisation <- function( x ) {
  
  # read attributes
  N      <- attr(x, "N")
  G      <- attr(x, "G")
  rownam <- attr(x, "rownam")
  
  # create output vector
  f <- vector()
  
  # sum columns excluding the moving block diagonal of width G (no. of sectors)
  for (j in 1:N) {
    p <- seq( ((j-1)*N + 1),
              j*N         )
    
    f[p] <- colSums(x[-p,p])
  }
  
  f <- as.data.frame(f)
  rownames(f) <- rownam
  names(f) <- "vertical_specialisation"
  
  return(f)
  
}