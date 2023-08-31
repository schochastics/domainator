# domainator

<!-- badges: start -->
[![R-CMD-check](https://github.com/schochastics/domainator/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/schochastics/domainator/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

domainator wraps various APIs and provides lists to classify domains. This includes

**APIs**

- [webshrinker](https://webshrinker.com) (commercial)
- [klazify](https://www.klazify.com/) (commercial)
- [whoisxmlapi](https://whoisxmlapi.com) (commercial)

**Lists**

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

## Example

