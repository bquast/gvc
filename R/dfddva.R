#' Domestic Final Demand Domestic Value Added
#' 
#' @name dfddva
#' @param x A Leontief decomposed Inter-Country Input Output table as created by decompr, which should be post multiplied with final demand (using the parameter: post="final_demand")
#' @param aggregate should dfddva be aggregated along source industries to a national sum?
#' @export
#' @import decompr
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
#'             out,
#'             method = "leontief",
#'             post = "final_demand")
#'  
#'  # apply dfddva
#'  dfddva( l )

dfddva <- function ( x, aggregate=TRUE ) {
  
  # read attributes
  k      <- attr(x, "k")
  i      <- attr(x, "i")
  # rownam <- attr(x, "rownam")
  G <- length(k)
  N <- length(i)
  
  # transform back to 2dim x 2dim matrix
  x <- matrix(x[,4], nrow=G*N, byrow=TRUE)
  
  # remove everything except exports to self
  x <- diagonals::rectangle_matrix( x, step=N )
  
  # aggregate or not
  if (aggregate) {
    x <- colSums(x)
    
    x <- data.frame(country = k, dfddva = x)
    
    return(x)
    
  } else {
    
  }

  
}
