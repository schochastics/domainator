get_token <- function(service = "shrinker") {
    token <- switch(service,
        shrinker = .key_to_base64(),
        klazify = Sys.getenv("KLAZIFY_TOKEN"),
        whoisxml = Sys.getenv("WHOISXML_TOKEN")
    )
    if (token == "") {
        rlang::abort("token not found in .Renviron")
    }
    token
}

.key_to_base64 <- function() {
    key <- Sys.getenv("SHRINKER_TOKEN")
    raw_str <- charToRaw(key)
    base64enc::base64encode(raw_str)
}
