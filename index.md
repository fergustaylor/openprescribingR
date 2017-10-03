
<style>
    iframe {
        width: 500px;
        height: 500px;
    }
</style>
<iframe src="https://fergustaylor.github.io/blogimages/post5map/">
</iframe>

[See the map.](https://fergustaylor.github.io/blogimages/post5map)

OpenprescribingR is a small package I made to import OpenPrescribing.net data directly into RStudio.

It uses the (beta) RESTful API from OpenPrescribing.

You could still download it onto your desktop directly from the API, but if you're going to be doing analysis with R, I think that doing this in-studio makes it much easier and more reproduceable.

UPDATE 23/08/17: Added an `as_sf` parameter to return a Simple Features Collection by specification instead. 

UPDATE 19/08/17: Working on a validation function, so that you can double-check your evidence against the NHS Digital versions.
OBviously this would involve downloading each month's (depending on what you'd imported), and then cross-referencing it against your selection so would only be worth running once you're not going to make any further changes.

The package is split into the look-up and the data import functions.

Installation:

`library(devtools)`

`devtools::install_github("fergustaylor/openprescribingR")`

Load:

`library(openprescribingR)`


__These functions give details on drugs/organisations/list sizes.__

 *  drug_details()

 *  organisation_codes()
 
 *  list_size()
 
 *  CCG_boundaries_or_location()

__These functions allow you to load spending data.__

 *  spending_by_CCG()

 *  spending_by_code()

 *  spending_by_practice()

Read the [wiki](https://github.com/fergustaylor/openprescribingR/wiki) for more help.

Or try `help('openprescribingR')`

Further explanation on the terms used here - [https://openprescribing.net/api/](https://openprescribing.net/api/)

Essential reading on [https://openprescribing.net/caution/](https://openprescribing.net/caution/)

[![Picture](openpres.png)](https://openprescribing.net/ "https://openprescribing.net/")

<iframe width="560" height="315" src="https://www.youtube.com/embed/U-hvuEfUUOM" frameborder="0" allowfullscreen></iframe>

[Other projects I'm working on.](https://fergustaylor.github.io) 

