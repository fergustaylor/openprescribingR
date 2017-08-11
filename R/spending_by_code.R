#'Queries from August 2010 to date and returns total spending and items by month.
#' 
#' @param BNF_code A code found using drug_details(). Or the BNF.
#' @return Returns total spending and items by month.
#' @export
#' @examples
#' spending_by_code() 
#' spending_by_code(BNF_code = "0212")
spending_by_code <- function(BNF_code = NULL){
  if (!is.null(BNF_code)) {variablesegment <- stringr::str_c("?code=", BNF_code)} 
  else {variablesegment <- "?format=api"}
  stringr::str_c("https://openprescribing.net/api/1.0/", "spending/", variablesegment, "&format=csv") %>%
    getURL() %>%
    getURL() %>%
    textConnection() %>%
    read.csv()
}