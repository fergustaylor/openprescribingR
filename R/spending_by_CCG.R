#'Queries from April 2013 to date and returns spending and items by CCG by month.
#' 
#' @param chemical_section_or_presentation_code An ID unique to BNF sections, chemicals or presentation found using drug_details().
#' @param CCG_code A code/ID found using organisation_codes().
#' @return Returns spending and items by CCG by month.
#' @importFrom magrittr "%>%"
#' @export
#' @examples
#' spending_by_CCG(chemical_section_or_presentation_code = "0212000AA") 
#' spending_by_CCG(CCG_code = "03V")
#' spending_by_CCG(chemical_section_or_presentation_code = "0212000AA", CCG_code = "03V")
spending_by_CCG <- function(chemical_section_or_presentation_code = NULL, CCG_code = NULL){
  if (!is.null(chemical_section_or_presentation_code) & is.null(CCG_code)) {variablesegment <- stringr::str_c("code=", chemical_section_or_presentation_code)} 
  if (!is.null(CCG_code) & is.null(chemical_section_or_presentation_code)) {variablesegment <- stringr::str_c("&org=", CCG_code)}
  if (!is.null(CCG_code) & !is.null(CCG_code)) {variablesegment <- stringr::str_c("code=", chemical_section_or_presentation_code, "&org=", CCG_code)}
  if (is.null(chemical_section_or_presentation_code) & is.null(CCG_code)) {warning("chemical_section_or_presentation_code and/or CCG_code required")}
  stringr::str_c("https://openprescribing.net/api/1.0/", "spending_by_ccg/?", variablesegment, "&format=csv") %>%
    RCurl::getURL() %>%
    textConnection() %>%
    read.csv()
}