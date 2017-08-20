#'Search for the official name and code of BNF sections, chemicals and presentations.
#'
#' @param name Drug name.
#' @param chemical_section_or_presentation_code An ID unique to BNF sections, chemicals or presentations.
#' @param BNF_section The BNF section.
#' @param exact_name_or_code Search by an exact name/code(ID).
#' @return Returns official names and codes(ID) of BNF sections, chemicals and presentations.
#' @importFrom magrittr "%>%"
#' @export
#' @examples
#' All BNF sections, chemicals and presentations matching a name (case-insensitive) = drug_details(name= "lipid")
#' All chemicals and presentations matching a code = drug_details(chemical_section_or_presentation_code= "0212000AA")
#' All BNF sections matching a code = drug_details(BNF_section= "2.4")
#' All BNF sections, chemicals and presentations exactly matching a name or code = drug_details(exact_name_or_code= "212000AA")
#' Or a variation of the above (with at least 1 name, chemical_section_or_presentation_code, BNF_section, or exact_name_or_code).
#' N.B For now the use of multiple terms in one category requires "&q=", e.g drug_details(name="lipid&q=drug")
#' Read the [wiki](https://github.com/fergustaylor/openprescribingR/wiki) for more help.
drug_details <- function(name = NULL, chemical_section_or_presentation_code = NULL, BNF_section = NULL, exact_name_or_code = NULL){
  if (!is.null(name)){variablesegment1 <- stringr::str_c("&q=", name)}
  if (!is.null(chemical_section_or_presentation_code)){variablesegment2 <- stringr::str_c("&q=", chemical_section_or_presentation_code)} 
  if (!is.null(BNF_section)){variablesegment3 <- stringr::str_c("&q=", BNF_section)}
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