.make_request_shrinker <- function(path = "categories/v3", params = list()) {
    token <- get_token(service = "shrinker")
    req <- httr2::request("https://api.webshrinker.com")
    req <- httr2::req_url_path_append(req, path)
    req <- httr2::req_headers(req, "Authorization" = paste0("Basic ", token))
    req <- httr2::req_user_agent(req, "domainator R package (http://github.com/schochastics/domainator)")
    if (length(params) != 0) {
        req <- httr2::req_url_query(req, !!!params)
    }
    # resp <- httr2::req_dry_run(req)
    resp <- httr2::req_perform(req)
    resp
}
#' List All Web Shrinker Categories
#' @description Returns all of the possible categories that URLs, hostnames, and IP addresses can be associated with.
#' @param taxonomy character. Which category taxonomy to use, either "iabv1" or "webshrinker"
#' @return list of categories
#' @examples
#' \dontrun{
#' get_categories_shrinker(taxonomy = "iabv1")
#' }
#' @export
get_categories_shrinker <- function(taxonomy = "iabv1") {
    taxonomy <- rlang::arg_match0(taxonomy, c("iabv1", "webshrinker"))
    params <- list("taxonomy" = taxonomy)
    resp <- .make_request_shrinker(path = "categories/v3", params)
    httr2::resp_body_json(resp)
}

#' Webshrinker Category Lookup
#' @description  returns the categories associated with the given URL, hostname, or IP address.
#' @inheritParams get_categories_shrinker
#' @param url character. URL to be categorized
#' @return data.frame with the inferred category and confidents score
#' @examples
#' \dontrun{
#' get_url_category_shrinker("kicker.de")
#' }
#' @export
get_url_category_shrinker <- function(url, taxonomy = "iabv1") {
    taxonomy <- rlang::arg_match0(taxonomy, c("iabv1", "webshrinker"))
    params <- list("taxonomy" = taxonomy)
    raw_url <- charToRaw(url)
    base64_url <- base64enc::base64encode(raw_url)
    resp <- .make_request_shrinker(path = paste0("categories/v3/", base64_url), params)
    dat <- httr2::resp_body_json(resp)
    res <- as.data.frame(do.call("rbind", dat$data[[1]]$categories))
    res[["url"]] <- dat$data[[1]]$url
    res[, c(6, 2, 4, 5, 1)]
}
