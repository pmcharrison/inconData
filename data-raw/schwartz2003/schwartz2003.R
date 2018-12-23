library(tidyverse)
library(hrep)
library(usethis)

schwartz2003 <- read_delim("data-raw/schwartz2003/figure-6.txt", delim = "\t") %>%
  mutate(pi_chord_type = interval %>%
           strsplit(" ") %>% map(as.integer) %>% map(pi_chord_type)) %>%
  transmute(name = label,
            pi_chord_type = pi_chord_type,
            chord_size = 2L,
            consonance_rank = consonance_rank)

use_data(schwartz2003, overwrite = TRUE)
