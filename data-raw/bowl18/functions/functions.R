library(dplyr)
library(purrr)
library(readr)
requireNamespace("plyr")

compile_bowling_data <- function() {
  map2(c(2L, 3L, 4L),
       c("dyads.csv", "triads.csv", "tetrads.csv"),
       process_csv) %>%
    bind_rows()
}

process_csv <- function(chord_size, file) {
  message("Processing ", file, "...")
  initialise_dat(chord_size, file) %>%
    add_representations(chord_size) %>%
    select(id, name, chord_size, rating_mean, rating_sd, rating_se,
           fr_chord, pi_chord, pi_chord_int, pc_chord_int)
}

initialise_dat <- function(chord_size, file) {
  dat <- file.path("data-raw/bowl18/data/", file) %>%
    read_csv(col_types = cols()) %>%
    mutate(id = recode(chord_size, `2` = "dy", `3` = "tr", `4` = "te") %>%
             paste(seq_along(name), "c", sep = ""),
           chord_size = chord_size) %>%
    select(id, everything()) %>%
    select(- c(bowling_harm_sim,  bowling_min_freq_int))
}

add_representations <- function(dat, chord_size) {
  dat %>%
    add_fr_chord(chord_size) %>%
    add_pc_chord_int(chord_size) %>%
    mutate(
      pi_chord = fr_chord %>% map(hrep::pi_chord),
      pi_chord_int = map2(fr_chord, pc_chord_int, get_pi_chord_int)
    )
}

add_fr_chord <- function(dat, chord_size) {
  cols <- get_cols("f", chord_size)
  dat$fr_chord <- merge_columns(dat[, cols])
  dat
}

add_pc_chord_int <- function(dat, chord_size) {
  cols <- get_cols("pc", chord_size)
  dat$pc_chord_int <- merge_columns(dat[, cols])
  dat
}

get_pi_chord_int <- function(fr_chord, pc_chord_int) {
  n <- length(fr_chord)
  res <- integer(n)
  res[1] <- fr_chord[1] %>% hrep::freq_to_midi() %>% round()
  for (i in 2:n) res[i] <- res[1] + pc_chord_int[i]
  hrep::pi_chord(res)
}

get_cols <- function(prefix, chord_size) {
  paste(prefix, seq_len(chord_size), sep = "_")
}

document_csv <- function(dat) {
  attr(dat$name, "label") <- "Name"
  attr(dat$name, "shortDescription") <-
    "English name for chord, after Bowling et al. (2018)"

  attr(dat$rating_rank, "label") <- "Perceptual consonance (ranked)"
  attr(dat$rating_rank, "shortDescription") <- paste(
    "Ranks are given compared to other chords with the same number of notes.",
    "Low numbers indicate highest consonance.",
    "Data collected in Bowling et al. (2018).")

  attr(dat$rating_mean, "label") <- "Perceptual consonance rating (mean)"
  attr(dat$rating_mean, "shortDescription") <- paste(
    "Ratings are on a four-point scale.",
    "High rating indicates high consonance.",
    "Data collected in Bowling et al. (2018).")

  attr(dat$rating_sd, "label") <- "Perceptual consonance rating (SD)"
  attr(dat$rating_sd, "shortDescription") <- paste(
    "Standard deviation for perceptual consonance ratings as reported in",
    "the column 'rating_mean'.",
    "Data collected in Bowling et al. (2018).")

  attr(dat$rating_se, "label") <- "Perceptual consonance rating (SE)"
  attr(dat$rating_se, "shortDescription") <- paste(
    "Standard error for perceptual consonance ratings as reported in",
    "the column 'rating_mean'.",
    "Data collected in Bowling et al. (2018).")

  # attr(dat$bowling_harm_sim, "label") <- "Harmonic similarity (Bowling)"
  # attr(dat$bowling_harm_sim, "shortDescription") <- paste(
  #   "Similarity to a harmonic series, as computed by Bowling et al. (2018).")
  #
  # attr(dat$bowling_min_freq_int, "label") <- "Min. frequency interval (Hz) (Bowling)"
  # attr(dat$bowling_min_freq_int, "shortDescription") <- paste(
  #   "Minimum frequency interval in the chord (Hz),",
  #   "as computed by Bowling et al. (2018).")

  dat
}

sanitise_dat <- function(dat) {
  for (col in c(
    sapply(c("f", "pitch_integer", "pc"),
           function(x) get_cols(x, attr(dat, "chord_size"))) %>%
    as.character()
  )) dat[[col]] <- NULL
  dat
}

merge_columns <- function(df) {
  df %>% t %>% as.data.frame %>% lapply(c) %>% unname %>% I
}
