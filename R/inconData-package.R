#' @keywords internal
"_PACKAGE"

#' Bowling et al. (2018)
#'
#' This dataset comes from the supplementary materials of
#' \insertCite{Bowling2018;textual}{inconData}.
#'
#' The dataset is represented as a [tibble][tibble::tibble-package]
#' with the following columns:
#'
#' * \code{id}: Unique ID for each chord.
#' * \code{name}: Chord name (only present for some chords).
#' * \code{chord_size}: Number of chord tones.
#' * \code{rating_mean}:
#' Mean consonance rating. Ratings were on a four-point scale,
#' where high ratings indicated high consonance.
#' * \code{rating_sd}: Standard deviation of consonance ratings.
#' * \code{rating_se}: Standard error of consonance ratings.
#' * \code{fr_chord}: Vector of chord frequencies.
#' * \code{pi_chord}: Vector of chord pitches, on MIDI note scale.
#' * \code{pi_chord_int}: An integer approximation of \code{pi_chord}.
#' * \code{pi_chord_type_int}:
#' \code{pi_chord_int} but expressed relative to the chord's bass note.
#' * \code{tuning_tonic_pc}:
#' The tonic pitch-class used for defining the just intonation
#' with which \code{fr_chord} and \code{pi_chord} are expressed.
#' * \code{tuning_tonic_pc_int}:
#' \code{tuning_tonic_pc} but expressed on the same integer scale
#' as \code{pi_chord_int}.
#'
#' @note
#' The table uses representations from the \code{hrep} package.
#' Loading the \code{hrep} package (\code{library(hrep)}
#' improves the way that chord objects are displayed.
#'
#' @references \insertAllCited
#' @name bowl18
#' @md
#' @docType data
#' @keywords data
NULL

#' @importFrom tibble tibble
NULL
