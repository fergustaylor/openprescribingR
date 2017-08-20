#' OpenprescribingR: A small package for OpenPrescribing data directly.
#' 
#' @section openprescribingR Functions:
#' 
#' * drug_details(name = NULL, chemical_section_or_presentation_code = NULL, BNF_section = NULL, exact_name_or_code = NULL)
#' 
#' * organisation_codes(organisation_code_or_name = NULL, CCG_code_or_name = NULL, practice_code_or_name = NULL, exact_name_or_code = NULL)
#' 
#' * list_size(list_size_by_code = NULL, ASTRO_PU_by_code = NULL)
#' 
#' * spending_by_CCG(chemical_section_or_presentation_code = NULL, CCG_code = NULL)
#' 
#' * spending_by_code(BNF_code = NULL)
#' 
#' * spending_by_practice(BNF_section_code = NULL, chemical_code = NULL, presentation_code = NULL, practice_code = NULL, CCG_code = NULL, date_code = NULL)
#' 
#' * CCG_boundaries_or_location(CCG_code = NULL, practice_code = NULL)
#' 
#' Read the [wiki](https://github.com/fergustaylor/openprescribingR/wiki) for more help.
#' @docType package
#' @name openprescribingR
NULL