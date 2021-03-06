% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/list_size.R
\name{list_size}
\alias{list_size}
\title{Search for details about a CCG or practice by code or name. Returns values for all months available.}
\usage{
list_size(list_size_by_code = NULL, ASTRO_PU_by_code = NULL)
}
\arguments{
\item{list_size_by_code}{A practice or CCG code found using organisation_codes().}

\item{ASTRO_PU_by_code}{A practice or CCG code found using organisation_codes().}
}
\value{
Returns values for all months available.
}
\description{
Search for details about a CCG or practice by code or name. Returns values for all months available.
}
\examples{
Total list size for all CCGs = list_size()
Total list size for all practices by practice code, or CCG code = list_size(list_size_by_code= "...")
ASTRO-PU cost and items for practices by practice code, or CCG code = list_size(ASTRO_PU_by_code= "...")
Or a variation of the above.
Read the [wiki](https://github.com/fergustaylor/openprescribingR/wiki) for more help.
}
