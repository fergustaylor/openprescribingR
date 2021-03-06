% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/CCG_boundaries_or_location.R
\name{CCG_boundaries_or_location}
\alias{CCG_boundaries_or_location}
\title{Search for the boundaries of a CCG, or location of a practice, by code. Returns GeoJSON or sfc.}
\usage{
CCG_boundaries_or_location(CCG_code = NULL, practice_code = NULL,
  as_sf = TRUE/FALSE)
}
\arguments{
\item{CCG_code}{A code assigned to each CCG, found using organisation_details().}

\item{practice_code}{A code assigned to each Practice, found using organisation_details().}

\item{as_sf}{If TRUE, Returns as Simple Features Collection instead.}
}
\value{
Returns the boundaries of a CCG, or location of a practice (or practices in a CCG). Returns GeoJSON (or sfc).
}
\description{
Search for the boundaries of a CCG, or location of a practice, by code. Returns GeoJSON or sfc.
}
\examples{
All organisations matching a code or name = organisation_codes(organisation_code_or_name= "...")
Boundaries of all CCGs = CCG_boundaries_or_location()
Boundaries of an individual CCG = CCG_boundaries_or_location(CCG_code = "99H")
Location (approximate) of a practice, or practices in a CCG, by code = CCG_boundaries_or_location(CCG_code = "99H", practice_code = "P87003")
Location (approximate) of a practice by code = CCG_boundaries_or_location(practice_code = "P87003")
Location (approximate) of all practices in a CCG, by code = location_function(CCG_code = "99H")
N.B ^ location_function is a bodge using organistation_codes to return a CCG_boundaries_or_location() for all practices in a CCG, but does require a bit more time to download the look-up it needs.

CCG_boundaries_or_location(as_sf = TRUE)
CCG_boundaries_or_location(CCG_code = "99H", as_sf = TRUE)
CCG_boundaries_or_location(CCG_code = "99H", practice_code = "P87003", as_sf = TRUE)
CCG_boundaries_or_location(practice_code = "P87003", as_sf = TRUE)
location_function(CCG_code = "99H", as_sf = TRUE)
Read the [wiki](https://github.com/fergustaylor/openprescribingR/wiki) for more help.
}
