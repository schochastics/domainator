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

get_categories_shrinker <- function(taxonomy = "iabv1") {
    taxonomy <- rlang::arg_match0(taxonomy, c("iabv1", "webshrinker"))
    params <- list("taxonomy" = taxonomy)
    resp <- .make_request_shrinker(path = "categories/v3", params)
    httr2::resp_body_json(resp)
}

get_url_category_shrinker <- function(url, taxonomy = "iabv1") {
    taxonomy <- rlang::arg_match0(taxonomy, c("iabv1", "webshrinker"))
    params <- list("taxonomy" = taxonomy)
    raw_url <- charToRaw(url)
    base64_url <- base64enc::base64encode(raw_url)
    resp <- .make_request_shrinker(path = paste0("categories/v3/", base64_url), params)
    httr2::resp_body_json(resp)
}
