#' Revealed Comparative Advantage
#' 
#' @name rca
#' @param x A Leontief decomposed Inter-Country Input Output table as created by decompr
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
  
  Eij <- rowSums(data[(((country_position-1)*N)+sector_position),])
  Eit <- 
  
}