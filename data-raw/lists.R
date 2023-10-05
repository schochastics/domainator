us_news <- readr::read_csv("https://raw.githubusercontent.com/ercexpo/us-news-domains/main/us-news-domains-v2.0.0.csv")
us_news$type[is.na(us_news$type)] <- "news"

usethis::use_data(us_news, overwrite = TRUE)

osfr::osf_retrieve_file("4zat2") |>
    osfr::osf_download(path = "./data-raw")

online_news <- readr::read_delim("./data-raw/Domain codes.csv", delim = ";")
unlink("./data-raw/Domain codes.csv")

usethis::use_data(online_news, overwrite = TRUE)
