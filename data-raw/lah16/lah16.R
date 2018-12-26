library(tidyverse)
library(hrep)

chord_types <- list(
  Add6 = c(0, 4, 7, 9),
  `Dom7#11` = c(0, 4, 7, 10, 14, 18),
  Dom9 = c(0, 4, 7, 10, 14),
  `Hex.` = c(0, 2, 4, 5, 7, 9),
  m7 = c(0, 3, 7, 10),
  m9 = c(0, 3, 7, 10, 14),
  M9 = c(0, 4, 7, 11, 14),
  MajorA = c(0, 4, 7),
  MajorB = c(0, 3, 8),
  MajorC = c(0, 5, 9),
  MinorA = c(0, 3, 7),
  MinorB = c(0, 4, 9),
  MinorC = c(0, 5, 8),
  `Neap.` = c(0, 1, 4, 6, 9),
  `Pent.` = c(0, 2, 4, 7, 9)
) %>% map(as.integer) %>% map(pi_chord_type)

lah16 <- "data-raw/lah16/chord_data.tab" %>%
  read_delim("\t", col_types = cols()) %>%
  group_by(chord, inversion) %>%
  summarise(num_ratings = n(),
            rating = mean(consonance),
            rating_sd = sd(consonance),
            rating_se = rating_sd / sqrt(n())) %>%
  ungroup() %>%
  rename(id = chord) %>%
  mutate(
    inversion = if_else(is.na(inversion),
                        "",
                        recode(inversion, Fifth = "C", Root = "A", Third = "B")),
    id = paste(id, inversion, sep = ""),
    pi_chord_type = map(id, ~ chord_types[[.]]),
    pi_chord = map(pi_chord_type, ~ pi_chord(as.integer(.) + 67L))
  ) %>%
  select(- inversion)

use_data(lah16, overwrite = TRUE)
