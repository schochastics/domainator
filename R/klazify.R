.make_request_klazify <- function(path = "api/categorize", params = list()) {
    token <- get_token(service = "klazify")
    req <- httr2::request("https://www.klazify.com/")
    req <- httr2::req_url_path_append(req, path)
    req <- httr2::req_headers(req, "Authorization" = paste0("Bearer ", token))
    req <- httr2::req_user_agent(req, "domainator R package (http://github.com/schochastics/domainator)")
    if (length(params) != 0) {
        req <- httr2::req_url_query(req, !!!params)
    }
    # resp <- httr2::req_dry_run(req)
    resp <- httr2::req_perform(req)
    resp
}

#' Klazify Category Lookup
#' @description  uses klazify.com to get the categories associated with the given URL.
#' @param url character. URL to be categorized (needs https://www.)
#' @param raw boolean. If TRUE returns the raw API response which contains more
#' information than only the categories.
#' @return data.frame with the inferred category and confidents score
#' @examples
#' \dontrun{
#' get_url_category_klazify("https://www.kicker.de")
#' }
#' @export
get_url_category_klazify <- function(url, raw = FALSE) {
    params <- list("url" = url)
    resp <- .make_request_klazify(path = "api/categorize", params)
    dat <- httr2::resp_body_json(resp)
    if (isTRUE(raw)) {
        return(dat)
    } else {
        cat <- as.data.frame(do.call("rbind", dat$domain$categories)) # returns more!!!
        cat[["url"]] <- url
        res <- cat[, c(4, 3, 1)]
        res$confident <- TRUE
        res$id <- names(cat)[3]
        res$name <- cat$IAB17
        names(res)[2:3] <- c("label", "score")
        res
    }
}
