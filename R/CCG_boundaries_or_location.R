#'Search for the boundaries of a CCG, or location of a practice, by code. Returns GeoJSON.
#'
#' @param CCG_code A code assigned to each CCG, found using organisation_details().
#' @param practice_code A code assigned to each Practice, found using organisation_details().
#' @return Returns the boundaries of a CCG, or location of a practice (or practices in a CCG). Returns GeoJSON.
#' @importFrom magrittr "%>%"
#' @export
#' @examples
#' All organisations matching a code or name = organisation_codes(organisation_code_or_name= "...")
#' Boundaries of all CCGs = CCG_boundaries_or_location()
#' Boundaries of an individual CCG = CCG_boundaries_or_location(CCG_code = "99H")
#' Location (approximate) of a practice, or practices in a CCG, by code = CCG_boundaries_or_location(CCG_code = "99H", practice_code = "P87003")
CCG_boundaries_or_location <- function(CCG_code = NULL, practice_code = NULL){
  if (is.null(CCG_code) & is.null(practice_code)) {variablesegment <- stringr::str_c("org_type=ccg")}
  if (!is.null(CCG_code) & is.null(practice_code)) {variablesegment <- stringr::str_c("org_type=ccg&q=", CCG_code)}
  if (is.null(CCG_code) & !is.null(practice_code)) {variablesegment <- stringr::str_c("q=", practice_code)}
  if (!is.null(CCG_code) & !is.null(practice_code)) {variablesegment <- stringr::str_c("q=", CCG_code, ",", practice_code)}
  stringr::str_c("https://openprescribing.net/api/1.0/", "org_location/?", variablesegment) %>%
    readLines() %>%
    rjson::fromJSON()
}