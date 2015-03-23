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
    
    # remove all exports
    x <- x[ which(x["Source_Country"] == x["Using_Country"]) , ]
    
    # export of sector of country
    Eij <- sum( x[ which( x["Source_Country"] == country & x["Source_Industry"] == sector ), ]["FVAX"] )
    
    # exports from country of sectors
    Eit <- sum( x[ which( x["Source_Country"] == country ), ]["FVAX"] )
    
    # exports of sector of countries
    Enj <- sum( x[ which( x["Source_Industry"] == sector ), ]["FVAX"] )
    
    # exports of sectors of country
    Ent <- sum( x["FVAX"] )
    
  } else {
    
    # extract attributes
    k      <- attr(x, "k")
    i      <- attr(x, "i")
    G <- length(k)
    N <- length(i)
    
    # remove exports to self
    x <- minus_block_matrix(x, N )
    
    # match country and sector string with positions in list
    country_position <- match(country, k)
    sector_position  <- match(sector,  i)
    
    # exports of sector from country
    Eij <- rowSums(x[(((country_position-1)*N)+sector_position),])
    
    # exports from country
    Eit <- sum( rowSums( x[((country_position*N)-N+1):(country_position*N),] ) )
    
    # exports of sector from countries
    Enj <- sum( rowSums( x[((seq(1:N)-1)*G)+sector_position,] ) )
    
    # exports of sectors from countries
    Ent <- sum( rowSums( x ))
    
  }
  
  
  # return Bela Balassa (1965) ratio
  return( (Eij/Eit)/(Enj/Ent) )
  
}