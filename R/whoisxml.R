.make_request_whoisxml <- function(path = "api/v2", params = list()) {
    token <- get_token(service = "whoisxml")
    req <- httr2::request("https://website-categorization.whoisxmlapi.com")
    req <- httr2::req_url_path_append(req, path)
    req <- httr2::req_url_query(req, apiKey = token)
    req <- httr2::req_user_agent(req, "domainator R package (http://github.com/schochastics/domainator)")
    if (length(params) != 0) {
        req <- httr2::req_url_query(req, !!!params)
    }
    # resp <- httr2::req_dry_run(req)
    resp <- httr2::req_perform(req)
    resp
}

#' Whoisxml Category Lookup
#' @description  uses whoisxmlapi to get the categories associated with the given URL
#' @param url character. URL to be categorized (doesnt need https://www.)
#' @return data.frame with the inferred category and confidents score
#' @examples
#' \dontrun{
#' get_url_category_whoisxml("kicker.de")
#' }
#' @export
get_url_category_whoisxml <- function(url) {
    params <- list("domainName" = url)
    resp <- .make_request_whoisxml(path = "api/v2", params)
    dat <- httr2::resp_body_json(resp)

    cat <- as.data.frame(do.call("rbind", dat))
    cat[["url"]] <- url
    res <- cat[, c(4, 3, 1)]
    res$confident <- TRUE
    res$id <- names(cat)[3]
    res$name <- cat$IAB17
    names(res)[2:3] <- c("label", "score")
    res
    }
}
