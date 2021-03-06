% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spending_by_CCG.R
\name{spending_by_CCG}
\alias{spending_by_CCG}
\title{Queries from April 2013 to date and returns spending and items by CCG by month.}
\usage{
spending_by_CCG(chemical_section_or_presentation_code = NULL,
  CCG_code = NULL)
}
\arguments{
\item{chemical_section_or_presentation_code}{An ID unique to BNF sections, chemicals or presentation found using drug_details().}

\item{CCG_code}{A code/ID found using organisation_codes().}
}
\value{
Returns spending and items by CCG by month.
}
\description{
Queries from April 2013 to date and returns spending and items by CCG by month.
}
\examples{
spending_by_CCG(chemical_section_or_presentation_code = "0212000AA") 
spending_by_CCG(CCG_code = "03V")
spending_by_CCG(chemical_section_or_presentation_code = "0212000AA", CCG_code = "03V")
Read the [wiki](https://github.com/fergustaylor/openprescribingR/wiki) for more help.
}
