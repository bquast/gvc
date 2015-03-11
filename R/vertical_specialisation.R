#' Vertical Specialisation
#' 
#' @name vertical_specialisation
#' @param x A Leontief decomposed Inter-Country Input Output table as created by decompr
#' @export
#' @examples 
#' # load the decompr package
#' library(decompr)
#' 
#' # load the example data set
#' data(leather)
#' 
#' # create a leontief decomposed data set
#' l <- decomp(inter,
#'             final,
#'             countries,
#'             industries,
#'             out, long=FALSE)
#'  
#'  # apply the vertical_specialisation analysis
#'  vertical_specialisation(l)

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
  f <- cbind(rep(k, each = N),
             rep(i, times = G),
             f)
  rownames(f) <- NULL  
  names(f) <- c("country", "sector", "vertical_specialisation")
  
  return(f)
  
}