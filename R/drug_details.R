#'Search for the official name and code of BNF sections, chemicals and presentations.
#'
#' @param name A code found using drug_details().
#' @param chemical_or_presentation_code A code found using drug_details().
#' @param BNF_section_code A code found using drug_details().
#' @param exact_name_or_code Search by an exact name/code.
#' @return Returns official names and codes of BNF sections, chemicals and presentations
#' @importFrom tidyverse "%>%"
#' @export
#' @examples
#' All BNF sections, chemicals and presentations matching a name (case-insensitive) = drug_details(name= "lipid")
#' All chemicals and presentations matching a code = drug_details(chemical_or_presentation_code= "...")
#' All BNF sections matching a code = drug_details(BNF_section_code= "...")
#' All BNF sections matching a code = drug_details(BNF_section_code= "...")
#' All BNF sections, chemicals and presentations exactly matching a name or code = drug_details(exact_name_or_code= "...")
#' Or a variation of the above (with at least 1 name, chemical_or_presentation_code, BNF_section_code, or exact_name_or_code).
#' N.B For now the use of multiple terms in one category requires "&q=", e.g drug_details(name="lipid&q=drug")
drug_details <- function(name = NULL, chemical_or_presentation_code = NULL, BNF_section_code = NULL, exact_name_or_code = NULL){
  if (!is.null(name)){variablesegment1 <- stringr::str_c("&q=", name)}
  if (!is.null(chemical_or_presentation_code)){variablesegment2 <- stringr::str_c("&q=", chemical_or_presentation_code)} 
  if (!is.null(BNF_section_code)){variablesegment3 <- stringr::str_c("&q=", BNF_section_code)}
  if (!is.null(exact_name_or_code)){variablesegment4 <- stringr::str_c("&q=", exact_name_or_code, "&exact=true")}
  variablesegment <- stringr::str_c(
    if(exists("variablesegment1")){variablesegment1},
    if(exists("variablesegment2")){variablesegment2},
    if(exists("variablesegment3")){variablesegment3},
    if(exists("variablesegment4")){variablesegment4})
  stringr::str_c("https://openprescribing.net/api/1.0/bnf_code/?", variablesegment, "&format=csv") %>%
    RCurl::getURL() %>%
    textConnection() %>%
    read.csv()
}