#' Upstreamness
#' 
#' @name upstream
#' @param x A Leontief decomposed Inter-Country Input Output table as created by decompr, which should be post multiplied with final demand (using the parameter: post="final_demand")
#' @export
#' @import decompr
#' @examples 
#' # load the decompr package
#' library(decompr)
#' 
#' # load example data
#' data(leather)
#' 
#' # create a leontief decomposed data set
#' l <- load_tables_vectors(inter,
#'             final,
#'             countries,
#'             industries,
#'             out)
#'  
#'  # apply upstream
#'  upstream( l )

upstream <- function ( x ) {
  
  solve( diag(x$GN) - (t(t(x$A)*x$X)/x$X) ) %*% matrix(1, nrow=x$GN)
  
}
