get_token <- function(service = "shrinker") {
    switch(service,
        shrinker = .key_to_base64(),
        klazify = Sys.getenv("KLAZIFY_TOKEN"),
        whoisxml = Sys.getenv("WHOISXML_TOKEN")
    )
}

.key_to_base64 <- function() {
    key <- Sys.getenv("SHRINKER_TOKEN")
    if (key == "") {
        rlang::abort("SHRINKER_TOKEN token not found in .Renviron")
    }
    raw_str <- charToRaw(key)
    base64enc::base64encode(raw_str)
}
