#'Search for the locations of all (GP) practices, by code. Returns GeoJSON or sfc.
#'
#' @param CCG_code A code assigned to each CCG, found using organisation_details().
#' @param as_sf If TRUE, Returns as Simple Features Collection instead.
#' @return Returns the locations of all GP practices in a CCG). Returns GeoJSON (or sfc).
#' @importFrom magrittr "%>%"
#' @export
#' @examples
#' Location (approximate) of all practices in a CCG = location_function(CCG_code, as_sf = TRUE/FALSE)
#' location_function("99H", as_sf = TRUE)
#' Read the [wiki](https://github.com/fergustaylor/openprescribingR/wiki) for more help.
location_function <- function(CCG_code, as_sf = TRUE/FALSE)
{
  practicelist <- stringr::str_c("https://openprescribing.net/api/1.0/org_code/?&format=csv") %>%
    RCurl::getURL() %>%
    textConnection() %>%
    read.csv() %>%
    dplyr::filter(ccg == CCG_code)
  
  practice_code <- paste(practicelist[,'id'],sep="", collapse=",")
  
  variablesegment <- stringr::str_c("q=", CCG_code, ",", practice_code)
  
  if (as_sf == TRUE) {
    table1 <- stringr::str_c("https://openprescribing.net/api/1.0/org_location/?org_type=ccg&q=", CCG_code) %>% 
      sf::st_read() %>% 
      sf::st_as_sf() %>%
      dplyr::select(-ons_code) %>%
      dplyr::mutate(setting = NA)
    
    table2 <- stringr::str_c("https://openprescribing.net/api/1.0/", "org_location/?", variablesegment) %>% 
      sf::st_read() %>% 
      sf::st_as_sf() %>%
      dplyr::mutate(org_type = "clinic")
    
    rbind(table1, table2)
    }
  
  else {
    stringr::str_c("https://openprescribing.net/api/1.0/", "org_location/?", variablesegment) %>%
      readLines() %>%
      rjson::fromJSON()
    }  
}

#dev_note consider taking from liststize subsection instead (maybe quicker?)