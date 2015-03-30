#' New Revealed Comparative Advantage
#' 
#' @name nrca
#' @param x A decomposed Inter-Country Input Output table as created by decompr
#' @param country target country
#' @param sector target sector
#' @export

nrca <- function ( x, country, sector ) {
  
  if ( attr(x, "decomposition") == "wwz" ) {
    
    # remove exports to self
    x <- x[ which(!x["Exporting_Country"] == x["Importing_Country"]) , ]
    
    # export of sector of country
    Eij <- sum( x[ which( x["Exporting_Country"] == country & x["Exporting_Industry"] == sector ), ]["DViX_Fsr"] )
    
    # exports from country of sectors
    Eit <- sum( x[ which( x["Exporting_Country"] == country ), ]["DViX_Fsr"] )
    
    # exports of sector of countries
    Enj <- sum( x[ which( x["Exporting_Industry"] == sector ), ]["DViX_Fsr"] )
    
    # exports of sectors of country
    Ent <- sum( x["DViX_Fsr"] )
    
  } else if ( attr(x, "long") == TRUE ) {
    
    
    # extract attributes
    k      <- attr(x, "k")
    i      <- attr(x, "i")
    G <- length(k)
    N <- length(i)
    
    x <- matrix(x[,5], nrow=G*N, byrow=TRUE)
    
    # remove anything but exports to self
    f <- rowSums(block_matrix(x, N ) )
    t <- rowSums(block_matrix(x, N) )
    q <- sum(rowSums(block_matrix(x, N)))
    
    # sum across rows (source industry)
    # divide by own exports to self
    for (j in 1:G) {
      s <- seq( ((j-1)*N + 1), j*N )
      f[s] <- f[s] / sum(f[s])
    }
    
    # 
    for (i in 1:N) {
      p <- (seq(1:G)*N) - N + i
      t[p] <- sum(t[p])
    }
    
    Eij <- f
    Eit <- 1
    Enj <- t
    Ent <- q
    
  } else {
    
    # extract attributes
    k      <- attr(x, "k")
    i      <- attr(x, "i")
    G <- length(k)
    N <- length(i)
    
    # remove anything but exports to self
    f <- rowSums(block_matrix(x, N ) )
    t <- rowSums(block_matrix(x, N) )
    q <- sum(rowSums(block_matrix(x, N)))
    
    # sum across rows (source industry)
    # divide by own exports to self
    for (j in 1:G) {
      s <- seq( ((j-1)*N + 1), j*N )
      f[s] <- f[s] / sum(f[s])
    }
    
    # 
    for (i in 1:N) {
      p <- (seq(1:G)*N) - N + i
      t[p] <- sum(t[p])
    }

    Eij <- f
    Eit <- 1
    Enj <- t
    Ent <- q
    
  }
  
  
  # return Bela Balassa (1965) ratio
  return( (Eij/Eit)/(Enj/Ent) )
  
}
