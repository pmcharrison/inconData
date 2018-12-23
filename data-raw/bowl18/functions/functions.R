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
    coerce() %>%
    rename(rating = rating_mean) %>%
    select(id, name, chord_size, rating, rating_sd, rating_se,
           fr_chord, pi_chord, pi_chord_int, pi_chord_type_int,
           tuning_tonic_pc,
           tuning_tonic_pc_int)
}

coerce <- function(x) {
  checkmate::qassert(x$tuning_tonic_pc_int, "X")
  mutate(x,
         tuning_tonic_pc_int = as.integer(tuning_tonic_pc_int))
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
    add_pi_chord_type_int(chord_size) %>%
    mutate(
      pi_chord = fr_chord %>% map(hrep::pi_chord),
      pi_chord_int = map2(fr_chord, pi_chord_type_int, get_pi_chord_int),
      tuning_tonic_pc = map_dbl(pi_chord, hrep::get_bass_pc),
      tuning_tonic_pc_int = map_dbl(pi_chord_int, hrep::get_bass_pc)
    )
}

add_fr_chord <- function(dat, chord_size) {
  cols <- get_cols("f", chord_size)
  dat$fr_chord <- merge_columns(dat[, cols]) %>% purrr::map(hrep::fr_chord)
  dat
}

add_pi_chord_type_int <- function(dat, chord_size) {
  cols <- get_cols("pc", chord_size)
  dat$pi_chord_type_int <- merge_columns(dat[, cols]) %>%
    purrr::map(hrep::pi_chord_type)
  dat
}

get_pi_chord_int <- function(fr_chord, pi_chord_type_int) {
  n <- length(fr_chord)
  res <- integer(n)
  res[1] <- fr_chord[1] %>% hrep::freq_to_midi() %>% round()
  for (i in 2:n) res[i] <- res[1] + pi_chord_type_int[i]
  hrep::pi_chord(res)
}

get_cols <- function(prefix, chord_size) {
  paste(prefix, seq_len(chord_size), sep = "_")
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
