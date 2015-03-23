#' Importing to Export
#' 
#' @name i2e
#' @param x A Leontief decomposed Inter-Country Input Output table as created by decompr
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
#'             out)
#'  
#'  # apply the Import to Exports analysis
#'  i2e(l)

i2e <- function( x ) {
  
  # read attributes
  k      <- attr(x, "k")
  i      <- attr(x, "i")
  # rownam <- attr(x, "rownam")
  G <- length(k)
  N <- length(i)
  
  # transform back to 2dim x 2dim matrix
  x <- matrix(x[,5], nrow=G*N, byrow=TRUE)
  
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

# alias

#' Vertical Specialization
#' @rdname i2e

vertical_specialisation <- i2e

# Americano alias

#' Vertical Specialisation
#' @rdname i2e
#' vertical_specialization <- i2e