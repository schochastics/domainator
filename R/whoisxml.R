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
    res <- as.data.frame(do.call("rbind", lapply(dat$categories, .flatten_category)))
    res[["url"]] <- url
    res[, c(7, 3, 1, 2, 6, 4, 5)]
}

.flatten_category <- function(cat) {
    t1 <- as.data.frame(cat$tier1)
    if (nrow(t1) == 0) {
        t1 <- data.frame(a = NA, b = NA, c = NA)
    }
    t2 <- as.data.frame(cat$tier2)
    if (nrow(t2) == 0) {
        t2 <- data.frame(a = NA, b = NA, c = NA)
    }
    names(t1) <- c("tier1_score", "tier1_id", "tier1_label")
    names(t2) <- c("tier2_score", "tier2_id", "tier2_label")
    as.data.frame(cbind(t1, t2))
}
