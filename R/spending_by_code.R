#'Queries from August 2010 to date and returns total spending and items by month.
#' 
#' @param BNF_code
#' @return Returns total spending and items by month.
#' @examples
#' spending_by_code() 
#' spending_by_code(BNF_code = "0212")
spending_by_code <- function(BNF_code = NULL){
  if (!is.null(BNF_code)) {variablesegment <- str_c("?code=", BNF_code)} 
  else {variablesegment <- "?format=api"}
  str_c("https://openprescribing.net/api/1.0/", "spending/", variablesegment, "&format=csv") %>%
    getURL() %>%
    getURL() %>%
    textConnection() %>%
    read.csv()
}