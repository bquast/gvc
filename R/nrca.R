#' New Revealed Comparative Advantage
#' 
#' @name nrca
#' @param data A Wang-Wei-Zhu decomposed Inter-Country Input Output table as created by decompr
#' @param country target country
#' @param sector target sector
#' @export

nrca <- function ( data, country, sector ) {
  
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
  
  # return out
  return( (Eij/Eit)/(Enj/Ent) )
}