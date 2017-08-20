#'Search for details about a CCG or practice by code or name. Returns values for all months available.
#'
#' @param list_size_by_code A practice or CCG code found using organisation_codes().
#' @param ASTRO_PU_by_code A practice or CCG code found using organisation_codes().
#' @return Returns values for all months available.
#' @importFrom magrittr "%>%"
#' @export
#' @examples
#' Total list size for all CCGs = list_size()
#' Total list size for all practices by practice code, or CCG code = list_size(list_size_by_code= "...")
#' ASTRO-PU cost and items for practices by practice code, or CCG code = list_size(ASTRO_PU_by_code= "...")
#' Or a variation of the above.
#' Read the [wiki](https://github.com/fergustaylor/openprescribingR/wiki) for more help.
list_size <- function(list_size_by_code = NULL, ASTRO_PU_by_code = NULL){
  if (is.null(list_size_by_code)&is.null(ASTRO_PU_by_code)){variablesegment1 <- stringr::str_c("ccg&keys=total_list_size")}
  if (!is.null(list_size_by_code)){variablesegment2 <- stringr::str_c("practice&org=", list_size_by_code, "&keys=total_list_size")} 
  if (!is.null(ASTRO_PU_by_code)){variablesegment3 <- stringr::str_c("practice&org=", ASTRO_PU_by_code, "&keys=astro_pu_items,astro_pu_cost")}
  variablesegment <- stringr::str_c(
    if(exists("variablesegment1")){variablesegment1},
    if(exists("variablesegment2")){variablesegment2},
    if(exists("variablesegment3")){variablesegment3})
  stringr::str_c("https://openprescribing.net/api/1.0/org_details/?org_type=", variablesegment, "&format=csv") %>%
    RCurl::getURL() %>%
    textConnection() %>%
    read.csv()
}