#'Queries from August 2010 to date and returns total spending and items by month.
#' 
#' @param BNF_code A code found using drug_details(). Or the BNF. chemical_section_or_presentation_code or BNF_section. Can be a section, or the specific code/id for each BNF section/drug/presentation.
#' @return Returns total spending and items by month.
#' @importFrom magrittr "%>%"
#' @export
#' @examples
#' spending_by_code() 
#' spending_by_code(BNF_code = "0212")
#' spending_by_code(BNF_code = "0212000AA")
#' spending_by_code(BNF_code = "0212000AABB")
#' spending_by_code(BNF_code = "2.4")
#' spending_by_code(BNF_code = drug_details(BNF_section = "2.4")$id[1])
spending_by_code <- function(BNF_code = NULL){
  if (!is.null(BNF_code)) {variablesegment <- stringr::str_c("?code=", BNF_code)} 
  else {variablesegment <- "?format=api"}
  stringr::str_c("https://openprescribing.net/api/1.0/", "spending/", variablesegment, "&format=csv") %>%
    RCurl::getURL() %>%
    textConnection() %>%
    read.csv()
}