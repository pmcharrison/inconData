library(tidyverse)
library(hrep)
library(usethis)

schwartz03 <- read_delim("data-raw/schwartz03/figure-6.txt", delim = "\t") %>%
  mutate(pi_chord_type = interval %>%
           strsplit(" ") %>% map(as.integer) %>% map(pi_chord_type)) %>%
  transmute(name = label,
            pi_chord_type = pi_chord_type,
            chord_size = 2L,
            consonance_rank = consonance_rank)

use_data(schwartz03, overwrite = TRUE)
