#'Queries from August 2010 to date and returns total spending and items by practice by month.
#'You must specify either an organisation, or a date.
#'
#' @param BNF_section_code A code found using drug_details().
#' @param chemical_code A code found using drug_details().
#' @param presentation_code A code found using drug_details().
#' @param practice_code A code found using organisation_codes().
#' @param CCG_code A code found using organisation_codes().
#' @param date_code A date using the format "2015-12-01".
#' @return Returns total spending and items by practice by month.
#' @export
#' @examples
#' spending_by_practice(BNF_section_code = "0212", date_code = "2015-04-01")
#' spending_by_practice(chemical_code = "0212000AA", date_code = "2015-04-01")
#' spending_by_practice(practice_code = "H81068")
#' spending_by_practice(CCG_code = "03V")
#' Or a variation of the above (with at least 1 practice_code, date_code, or CCG_code).
spending_by_practice <- function(BNF_section_code = NULL, chemical_code = NULL, presentation_code = NULL, practice_code = NULL, CCG_code = NULL, date_code = NULL){
  if (!is.null(BNF_section_code)){variablesegment1 <- str_c("&code=", BNF_section_code)}
  if (!is.null(chemical_code)){variablesegment2 <- str_c("&code=", chemical_code)} 
  if (!is.null(presentation_code)){variablesegment3 <- str_c("&code=", presentation_code)}
  if (!is.null(practice_code)){variablesegment4 <- str_c("&org=", practice_code)} 
  if (!is.null(CCG_code)){variablesegment5 <- str_c("&org=", CCG_code)} 
  if (!is.null(date_code)){variablesegment6 <- str_c("&date=", date_code)} 
  if (is.null(practice_code) & is.null(date_code) & is.null(CCG_code)){warning("You must specify either an organisation (practice_code), or a date (date_code).")}
  variablesegment <- str_c(
    if(exists("variablesegment1")){variablesegment1},
    if(exists("variablesegment2")){variablesegment2},
    if(exists("variablesegment3")){variablesegment3},
    if(exists("variablesegment4")){variablesegment4},
    if(exists("variablesegment5")){variablesegment5},
    if(exists("variablesegment6")){variablesegment6})
  str_c("https://openprescribing.net/api/1.0/", "spending_by_practice/?", variablesegment, "&format=csv") %>%
    getURL() %>%
    textConnection() %>%
    read.csv()
}