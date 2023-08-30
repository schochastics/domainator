# domainator

<!-- badges: start -->
<!-- badges: end -->

domainator wraps various APIs to classify domains. This includes

- [webshrinker](https://webshrinker.com)

## Installation

You can install the development version of domainator like so:

``` r
#install.packages("remotes")
remotes::install_github("schochastics/domainator")
```

## Authentication
In all cases, you need to add API keys/secrets/tokens to the `.Renviron`` file (for example using `usethis::edit_r_environ()`)

### Web Shrinker
Get API Key and Secret from [here](https://app.webshrinker.com/api-access-keys.)
Add SHRINKER_TOKEN="your-access-key:your-secret-key" to `.Renviron`

## Example

