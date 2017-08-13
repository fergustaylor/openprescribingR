#'Search for details about a CCG or practice by code or name.
#'
#' @param organisation_code_or_name The CCG/Practice's unique code, or part of its name.
#' @param CCG_code_or_name The CCG unique code, or part of its name.
#' @param practice_code_or_name The CCG unique code, or part of its name.
#' @param exact_name_or_code The CCG/Practice's exact code, or name.
#' @return Returns details about a CCG or practice by code or name.
#' @importFrom magrittr "%>%"
#' @export
#' @examples
#' All organisations matching a code or name = organisation_codes(organisation_code_or_name= "Beaumont")
#' All CCGs matching a code or name = organisation_codes(CCG_code_or_name= "Gloucester")
#' #' All practices matching a code or name = organisation_codes(practice_code_or_name= "Gloucester")
#' All organisations exactly matching a code or name = organisation_codes(exact_name_or_code= "99H")
#' Or a variation of the above (with at least 1 organisation_code_or_name, CCG_code_or_name, practice_code_or_name, or exact_name_or_code).
#' N.B For now the use of multiple terms in one category requires "&q=", e.g organisation_codes(organisation_code_or_name= "Beaumont&q=Gloucester")
organisation_codes <- function(organisation_code_or_name = NULL, CCG_code_or_name = NULL, practice_code_or_name = NULL, exact_name_or_code = NULL){
  if (!is.null(organisation_code_or_name)){variablesegment1 <- stringr::str_c("&q=", organisation_code_or_name)}
  if (!is.null(CCG_code_or_name)){variablesegment2 <- stringr::str_c("&q=", CCG_code_or_name, "&org_type=CCG")} 
  if (!is.null(practice_code_or_name)){variablesegment3 <- stringr::str_c("&q=", practice_code_or_name, "&org_type=practice")}
  if (!is.null(exact_name_or_code)){variablesegment4 <- stringr::str_c("exact=true", "&q=", exact_name_or_code)}
  variablesegment <- stringr::str_c(
    if(exists("variablesegment1")){variablesegment1},
    if(exists("variablesegment2")){variablesegment2},
    if(exists("variablesegment3")){variablesegment3},
    if(exists("variablesegment4")){variablesegment4})
  
  stringr::str_c("https://openprescribing.net/api/1.0/org_code/?", variablesegment, "&format=csv") %>%
    RCurl::getURL() %>%
    textConnection() %>%
    read.csv()
}