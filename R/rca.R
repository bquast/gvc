#' Revealed Comparative Advantage
#' 
#' @name rca
#' @param x A Leontief decomposed Inter-Country Input Output table as created by decompr
#' @export

rca <- function ( data, country, sector ) {
  data <- minus_block_matrix(data, length(sector) )
}