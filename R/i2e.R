#' Importing to Export
#' 
#' @name i2e
#' @param x A Leontief decomposed Inter-Country Input Output table as created by decompr
#' @param by variable to subset by
#' @param subset value(s) of the subset variable to select
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
#' l <- decomp(x = inter,
#'             y = final,
#'             k = countries,
#'             i = industries,
#'             o = out)
#'  
#'  # apply the Import to Exports analysis
#'  i2e( l )


i2e <- function( x, by=NULL, subset=NULL ) {
  
  # read attributes
  k      <- attr(x, "k")
  i      <- attr(x, "i")
  # rownam <- attr(x, "rownam")
  G <- length(k)
  N <- length(i)
  
  # select observations
  if (!is.null(by)) {
    position <- which(names(x) == by)
    x[which(x[position] != subset),]$FVAX <- 0
  }
  
  # transform back to 2dim x 2dim matrix
  x <- matrix(x[,5], nrow=G*N, byrow=TRUE)
  
  # remove exports to self
  f <- x - diagonals::fatdiag(diagonals::fatdiag(x, steps=G), steps=G )
  
  # sum over columns
  f <- colSums( f )

  # # divide by own exports
  # for (j in 1:N) {
  #   s <- seq( ((j-1)*N + 1), j*N )
  #   f[s] <- f[s] / sum(colSums(x[,s]))
  # }
  
  f <- as.data.frame(f)
  f <- cbind(rep(k, each = N),
             rep(i, times = G),
             f)
  rownames(f) <- NULL  
  names(f) <- c("country", "sector", "i2e")
  
  return(f)
  
}

# alias

#' Vertical Specialization
#' @rdname i2e

vertical_specialisation <- i2e

# Americano alias

#' Vertical Specialisation
#' @rdname i2e
vertical_specialization <- i2e