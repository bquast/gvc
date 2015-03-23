#' Exporting to Re-export
#' 
#' @name e2r
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
#'  e2r(l, "Turkey", "Agriculture")

e2r <- function( x, country, sector  ) {
  
  # remove sourced to self
  x <- x[ which(x["Source_Country"] == x["Using_Country"]) , ]
  
  # sourcing country and industry
  Eij <- sum(  x[ which( x["Source_Country"] == country & x["Source_Industry"] == sector ),]["FVAX"]  )

  # using country
  Ei <- sum( x[ which( x["Using_Country"] == country ), ]["FVAX"] )
  
  
  return(Eij / Ei)
    
}

