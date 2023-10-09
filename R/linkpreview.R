.make_request_linkpreview <- function(path = "", params = list()) {
    token <- get_token(service = "linkpreview")
    req <- httr2::request("https://api.linkpreview.net")
    req <- httr2::req_url_path_append(req, path)
    req <- httr2::req_headers(req, "X-Linkpreview-Api-Key" = token)
    req <- httr2::req_user_agent(req, "domainator R package (http://github.com/schochastics/domainator)")
    if (length(params) != 0) {
        req <- httr2::req_url_query(req, !!!params)
    }
    # resp <- httr2::req_dry_run(req)
    resp <- httr2::req_perform(req)
    resp
}

#' linkpreviewer
#' @description  use linkpreview to get the description of a URL.
#' @param url character. URL to be categorized
#' @return data.frame with the title and description of a website
#' @examples
#' \dontrun{
#' get_url_category_linkpreview("https://www.google.com")
#' }
#' @export
get_url_category_linkpreview <- function(url) {
    params <- list("q" = utils::URLencode(url))
    resp <- .make_request_linkpreview(path = "", params)
    dat <- httr2::resp_body_json(resp)
    data.frame(dat)
}
