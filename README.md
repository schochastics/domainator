# domainator <img src="man/figures/logo.png" align="right" height="139" alt="" />

<!-- badges: start -->
[![R-CMD-check](https://github.com/schochastics/domainator/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/schochastics/domainator/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

domainator wraps various APIs and provides lists to classify domains. This includes

**APIs**

- [webshrinker](https://webshrinker.com) (commercial)
- [klazify](https://www.klazify.com/) (commercial)
- [whoisxmlapi](https://whoisxmlapi.com) (commercial)
- [linkpreview](https://my.linkpreview.net/) (commercial)

**Lists**

- Stier, S., Mangold, F., Scharkow, M., & Breuer, J. (2022). Post Post-Broadcast
  Democracy? News Exposure in the Age of Online Intermediaries. American
  Political Science Review, 116(2), 768-774.
- https://doi.org/10.5281/zenodo.7651047
- https://osf.io/5pe27/


`domainator` is part of a series of R packages to analyse webtracking data:

- [webtrackR](https://github.com/schochastics/webtrackR): preprocess raw webtracking data
- [domainator](https://github.com/gesistsa/domainator): classify domains
- [adaR](https://github.com/gesistsa/adaR): parse urls

## Installation

You can install the development version of domainator like so:

``` r
#install.packages("remotes")
remotes::install_github("schochastics/domainator")
```

## Authentication
In all cases, you need to add API keys/secrets/tokens to the `.Renviron` file (for example using `usethis::edit_r_environ()`)

### Web Shrinker
Get the API Key and Secret from
[here](https://app.webshrinker.com/api-access-keys).  
Add SHRINKER_TOKEN="your-access-key:your-secret-key" to `.Renviron`

### Klazify
Get the API Bearer token from [here](https://www.klazify.com/category).  
Add KLAZIFY_TOKEN="your-token" to `.Renviron`

### whoisxmlapi
Get the API key from
[here](https://website-categorization.whoisxmlapi.com/api/documentation/v2/making-requests).  
Add WHOISXML_TOKEN="your-token" to `.Renviron`


### linkpreview

Get the API key from [here](https://my.linkpreview.net/).  
Add LINKPREVIEW_TOKEN="your-token" to `.Renviron`


## Achknowledgement

The hexsticker was created from  
- <a href="https://www.flaticon.com/de/kostenlose-icons/url" title="url Icons">Url Icons erstellt von Freepik - Flaticon</a>
- <a href="https://www.flaticon.com/de/kostenlose-icons/einstufung" title="einstufung Icons">Einstufung Icons erstellt von Eucalyp - Flaticon</a>

