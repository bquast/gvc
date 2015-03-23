#' New Revealed Comparative Advantage
#' 
#' @name nrca
#' @param data A decomposed Inter-Country Input Output table as created by decompr
#' @param country target country
#' @param sector target sector
#' @export

nrca <- function ( data, country, sector ) {
  
  if ( attr(data, "decomposition") == "wwz" ) {
    
    # remove exports to self
    data <- data[ which(!data["Exporting_Country"] == data["Importing_Country"]) , ]
    
    # export of sector of country
    Eij <- sum( data[ which( data["Exporting_Country"] == country & data["Exporting_Industry"] == sector ), ]["DViX_Fsr"] )
    
    # exports from country of sectors
    Eit <- sum( data[ which( data["Exporting_Country"] == country ), ]["DViX_Fsr"] )
    
    # exports of sector of countries
    Enj <- sum( data[ which( data["Exporting_Industry"] == sector ), ]["DViX_Fsr"] )
    
    # exports of sectors of country
    Ent <- sum( data["DViX_Fsr"] )
    
  } else if ( attr(data, "long") == TRUE ) {
    
    # remove all exports
    data <- data[ which(data["Source_Country"] == data["Using_Country"]) , ]
    
    # export of sector of country
    Eij <- sum( data[ which( data["Source_Country"] == country & data["Source_Industry"] == sector ), ]["FVAX"] )
    
    # exports from country of sectors
    Eit <- sum( data[ which( data["Source_Country"] == country ), ]["FVAX"] )
    
    # exports of sector of countries
    Enj <- sum( data[ which( data["Source_Industry"] == sector ), ]["FVAX"] )
    
    # exports of sectors of country
    Ent <- sum( data["FVAX"] )
    
  } else {
    
    # extract attributes
    k      <- attr(data, "k")
    i      <- attr(data, "i")
    G <- length(k)
    N <- length(i)
    
    # remove exports to self
    data <- minus_block_matrix(data, length(sector) )
    
    # match country and sector string with positions in list
    country_position <- match(country, k)
    sector_position  <- match(sector,  i)
    
    # exports of sector from country
    Eij <- rowSums(data[(((country_position-1)*N)+sector_position),])
    
    # exports from country
    Eit <- sum( rowSums( data[((country_position*N)-N+1):(country_position*N),] ) )
    
    # exports of sector from countries
    Enj <- sum( rowSums( data[((seq(1:N)-1)*G)+sector_position,] ) )
    
    # exports of sectors from countries
    Ent <- sum( rowSums( data ))
    
  }
  
  
  # return Bela Balassa (1965) ratio
  return( (Eij/Eit)/(Enj/Ent) )
  
}