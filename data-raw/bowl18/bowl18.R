source("data-raw/bowl18/functions/functions.R")
bowl18 <- compile_bowling_data()
usethis::use_data(bowl18, overwrite = TRUE)
