% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/shrinker.R
\name{get_url_category_shrinker}
\alias{get_url_category_shrinker}
\title{Webshrinker Category Lookup}
\usage{
get_url_category_shrinker(url, taxonomy = "iabv1")
}
\arguments{
\item{url}{character. URL to be categorized (does not need https://www.)}

\item{taxonomy}{character. Which category taxonomy to use, either "iabv1" or "webshrinker"}
}
\value{
data.frame with the inferred category and confidents score
}
\description{
uses webshrinker.com to get the categories associated with the given URL, hostname, or IP address
}
\examples{
\dontrun{
get_url_category_shrinker("kicker.de")
}
}
