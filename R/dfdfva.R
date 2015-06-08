#' Domestic Final Demand Foreign Value Added
#' 
#' @name dfdfva
#' @param x A Leontief decomposed Inter-Country Input Output table as created by decompr, which should be post multiplied with final demand (using the parameter: post="final_demand")
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
#'  # apply dfdfva
#'  dfdfva( l )

dfdfva <- function ( x, aggregate=TRUE ) {
  
  # read attributes
  k      <- attr(x, "k")
  i      <- attr(x, "i")
  # rownam <- attr(x, "rownam")
  G <- length(k)
  N <- length(i)
  
  # transform back to 2dim x 1dim matrix
  x <- matrix(x[,4], nrow=G*N, ncol=G, byrow=TRUE)
  
  # remove everything except exports to self
  x <- diagonals::minus_rectangle_matrix( x, step=N )
  
  # aggregate or not
  if (aggregate) {
    x <- colSums(x)
    
    x <- data.frame(country = k , dfdfva = x)
    
    return(x)
    
  } else {
    
  }
  
  

  #   # divide by own exports
  #   for (j in 1:N) {
  #     s <- seq( ((j-1)*N + 1), j*N )
  #     f[s] <- f[s] / sum(colSums(x[,s]))
  #   }
  

  
}
