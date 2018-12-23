library(tidyverse)
library(hrep)

f <- function(file) {
  read_csv(file, col_types = cols()) %>%
    mutate(pi_chord = strsplit(midi, " ") %>% map(as.integer) %>% map(pi_chord)) %>%
    rename(rating = mean_rating) %>%
    select(- midi)
}

jl12a <- f("data-raw/jl12/figure-2.csv")
jl12b <- f("data-raw/jl12/figure-3.csv")

use_data(jl12a, overwrite = TRUE)
use_data(jl12b, overwrite = TRUE)
