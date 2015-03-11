#' Revealed Comparative Advantage
#' 
#' @name rca
#' @param data A Leontief decomposed Inter-Country Input Output table as created by decompr
#' @param country target country
#' @param sector target sector
#' @export

rca <- function ( data, country, sector ) {
  
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
  
  # return Bela Balassa (1965) ratio
  return( (Eij/Eit)/(Enj/Ent) )
}